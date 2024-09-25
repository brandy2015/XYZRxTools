 

import RxSwift
import RxCocoa

// 用于封装压缩进度和最终结果的结构体
struct XYZCompressionProgress {
    let progress: CGFloat // 压缩进度百分比
    let compressedData: Data? // 最终压缩的图片数据
}

class XYZImageCompressor {
    // DisposeBag 用于管理订阅的生命周期
    let disposeBag = DisposeBag()

    // 将 UIImage 异步压缩到指定的大小并返回压缩进度和最终结果
    func compressImageWithProgress(image: UIImage?, targetSizeInKB: Int) -> Observable<XYZCompressionProgress> {
        print("开始压缩图片, 目标大小: \(targetSizeInKB) KB")
        
        // 确保 image 不为 nil
        guard let validImage = image else {
            print("图片为空，返回 nil")
            return Observable.just(XYZCompressionProgress(progress: 1.0, compressedData: nil))
        }
        
        return Observable<XYZCompressionProgress>.create { observer in
            DispatchQueue.global(qos: .background).async {
                let targetSizeInBytes = targetSizeInKB * 1024
                var compressionQuality: CGFloat = 1.0
                var imageData = validImage.jpegData(compressionQuality: compressionQuality)
                
                // 检查初始压缩数据是否可用
                guard imageData != nil else {
                    print("无法获取初始压缩数据，返回 nil")
                    observer.onNext(XYZCompressionProgress(progress: 1.0, compressedData: nil))
                    observer.onCompleted()
                    return
                }

                var currentProgress: CGFloat = 1.0

                // 循环压缩直到接近目标大小
                while let currentImageData = imageData, currentImageData.count > targetSizeInBytes && compressionQuality > 0.1 {
                    compressionQuality -= 0.1
                    imageData = validImage.jpegData(compressionQuality: compressionQuality)
                    
                    // 计算进度
                    let currentSizeInKB = CGFloat(currentImageData.count) / 1024
                    currentProgress = min(1.0, currentSizeInKB / CGFloat(targetSizeInKB))
                    
                    print("压缩中... 当前压缩比: \(compressionQuality)，当前大小: \(currentSizeInKB) KB，进度: \(currentProgress * 100)%")
                    
                    // 发送进度更新
                    observer.onNext(XYZCompressionProgress(progress: currentProgress, compressedData: nil))
                }

                // 最终压缩数据处理
                if let finalImageData = imageData {
                    print("压缩完成，最终大小: \(finalImageData.count / 1024) KB")
                    observer.onNext(XYZCompressionProgress(progress: 1.0, compressedData: finalImageData))
                } else {
                    print("压缩失败，返回 nil")
                    observer.onNext(XYZCompressionProgress(progress: 1.0, compressedData: nil))
                }
                
                observer.onCompleted()
            }
            
            // 返回 Disposable 以便于释放资源
            return Disposables.create()
        }
    }
}
