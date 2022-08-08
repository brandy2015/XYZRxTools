//
//  XYZ_RxUITextField.swift
//  XYZRxTools
//
//  Created by zhangzihao on 2022/8/8.
//

import Foundation
import XYZColor
import RxSwift

public extension UIColor{
    static var SelectedCellColor:UIColor = UIColor(hexString: "5D54C1")
    static var BorderColor:UIColor = UIColor(hexString: "DEDEDE")
}

//UITextField_RxExtension
public extension UITextField{
    
    func selectedHighlightedSuperView(EmailAddressIndicator:UIView,disposeBag:DisposeBag)  {
        self.rx.controlEvent([.editingDidBegin]) //状态可以组合
            .asObservable()
            .subscribe(onNext: {  [weak self] (_) in
                print(self as Any)
                print("开始编辑内容!")
                EmailAddressIndicator.backgroundColor  = .SelectedCellColor
        }).disposed(by: disposeBag)
        
        self.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {  [weak self] (_) in
            print(self as Any)
            EmailAddressIndicator.backgroundColor  = .lightGray
        }).disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEnd).subscribe(onNext: {  [weak self] (_) in
            print(self as Any)
            EmailAddressIndicator.backgroundColor  = .lightGray
        }).disposed(by: disposeBag)
    }
}
