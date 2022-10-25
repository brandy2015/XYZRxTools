//
//  XYZUIImage_RxXYZ.swift
//  XYZRxTools
//
//  Created by zhangzihao on 2022/10/24.
//

import UIKit
import RxSwift
import Photos

class XYZPhotoWriter {
    enum Errors: Error {
      case couldNotSavePhoto
    }
    
    static func save(_ image: UIImage) -> Observable<String> {
      return Observable.create { observer in

          var savedAssetId: String?
          PHPhotoLibrary.shared().performChanges({
              let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
              savedAssetId = request.placeholderForCreatedAsset?.localIdentifier
              
          }, completionHandler: { success, error in
              DispatchQueue.main.async {
                if success, let id = savedAssetId {
                  observer.onNext(id)
                  observer.onCompleted()
                } else {
                  observer.onError(error ?? Errors.couldNotSavePhoto)
                }
              }
          })
          return Disposables.create()
      }
    }
}
 
//How to use
///
///

/*
    @IBAction func actionSave() {
      guard let image = imagePreview.image else { return }

      PhotoWriter.save(image)
        .asSingle()
        .subscribe(
          onSuccess: { [weak self] id in
            self?.showMessage("Saved with id: \(id)")
            self?.actionClear()
          },
          onError: { [weak self] error in
            self?.showMessage("Error", description: error.localizedDescription)
          }
        )
        .disposed(by: bag)
    }
*/
