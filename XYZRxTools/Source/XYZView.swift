//
//  XYZView.swift
//  XYZRxTools
//
//  Created by zhangzihao on 2022/8/8.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

public extension UIView{
    func AddKeyBoardDis(disposeBag:DisposeBag){
        //添加一个点击手势
        let tapBackground = UITapGestureRecognizer()
        self.addGestureRecognizer(tapBackground)
 
        //页面上任意处点击，输入框便失去焦点
        tapBackground.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
}
       
        
//点按别处隐藏键盘
public extension UIViewController {
    
    func hideKeyboardOnTap(disposeBag:DisposeBag) {
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .disposed(by:  disposeBag)
    }
}
