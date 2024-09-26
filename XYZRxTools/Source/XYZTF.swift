import UIKit
import RxSwift
import RxCocoa

public extension UIViewController {
    
    func SelectedHighlightX(TFs: [UITextField], disposeBag: DisposeBag = DisposeBag()) {
        TFs.forEach { tf in
            tf.selectedHighlightedSuperView(borderWidth: 2, cornerRadius: 10, DefaultborderColor: .gray, borderColor: .white, disposeBag: disposeBag)
        }
    }
}

public extension UIView{
    
    func selectedHighlighted(borderWidth:Double = 1.0,cornerRadius:Double = 10,DefaultborderColor:UIColor = .lightGray,borderColor:UIColor = .label,disposeBag:DisposeBag)  {
        
        
        self.AddBorder(borderWidth: borderWidth, borderColor: borderColor)
        self.CornerRadius(cornerRadius: CGFloat(cornerRadius))
        afterDelay(0.3) {
            self.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        }
    }
}
///延迟调用
private func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
