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
       
        
