//
//  PHPhotoLibrary+Rx.swift
//  XYZRxTools
//
//  Created by zhangzihao on 2022/10/25.
//

import UIKit
import Foundation
import Photos
import RxSwift

public extension PHPhotoLibrary {
    static var authorized: Observable<Bool> {
        return Observable.create { observer in
            DispatchQueue.main.async {
                if authorizationStatus() == .authorized {
                    observer.onNext(true)
                    observer.onCompleted()
                } else {
                    observer.onNext(false)
                    requestAuthorization { newStatus in
                        observer.onNext(newStatus == .authorized)
                        observer.onCompleted()
                    }
                }
            }
            return Disposables.create()
        }
    }
}


//使用
///Next, in viewDidLoad(), add:
///
//private let bag = DisposeBag()
//let authorized = PHPhotoLibrary.authorized
//  .share()


//authorized
//  .skipWhile { !$0 }
//  .take(1)
//  .subscribe(onNext: { [weak self] _ in
//    self?.photos = PhotosViewController.loadPhotos()
//    DispatchQueue.main.async {
//      self?.collectionView?.reloadData()
//    }
//  })
//  .disposed(by: bag)

//authorized
//  .skip(1)
//  .takeLast(1)
//  .filter { !$0 }
//  .subscribe(onNext: { [weak self] _ in
//    guard let errorMessage = self?.errorMessage else { return }
//    DispatchQueue.main.async(execute: errorMessage)
//  })
//  .disposed(by: bag)

//优化成
//authorized
//  .distinctUntilChanged()
//  .takeLast(1)
//  .filter { !$0 }







////////////
///
//private func errorMessage() {
//  alert(title: "No access to Camera Roll",
//    text: "You can grant access to Combinestagram from the Settings app")
//    .asObservable()
//    .take(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onCompleted: { [weak self] in
//      self?.dismiss(animated: true, completion: nil)
//      _ = self?.navigationController?.popViewController(animated: true)
//    })
//    .disposed(by: bag)
//}


//    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
