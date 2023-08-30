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
//import UIKit
//import RxSwift
//
////UITextField_RxExtension
///
 


public extension UITextField{

    func selectedHighlightedSuperView(borderWidth:Double = 2.0,cornerRadius:Double = 10,DefaultborderColor:UIColor = .clear,borderColor:UIColor = .label,disposeBag:DisposeBag)  {
  
        
        self.superview?.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        self.superview?.CornerRadius(cornerRadius: CGFloat(cornerRadius))

        self.rx.controlEvent([.editingDidBegin]) //状态可以组合
            .asObservable()
            .subscribe(onNext: {   (_) in
                self.superview?.AddBorder(borderWidth: borderWidth, borderColor: borderColor)
            }).disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {
                   (_) in
            self.superview?.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        }).disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEnd).subscribe(onNext: {
                    (_) in
            self.superview?.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        }).disposed(by: disposeBag)
    }
}


//圆角

extension UIView{
    func CornerRadius(cornerRadius:CGFloat = 20) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
extension UIView{
    //添加View的边缘效果线
    func AddBorder(borderWidth:Double = 1.0,borderColor:UIColor = .lightGray)  {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        
        //
        //            // 设置UIView的边框为圆角和展现
        //
        //            cell.layer.cornerRadius = 10
        //
        //            //自动遮罩不可见区域,超出的不显示
        //
        //            cell.layer.masksToBounds = true
        //
        //            cell.backgroundColor = UIColor.whiteColor()

    }
} 

public extension UITextField{

    func selectedHighlightedSuperSuperView(BGView:UIView,borderWidth:Double = 2.0,cornerRadius:Double = 10,DefaultborderColor:UIColor = .darkGray,borderColor:UIColor = .white,disposeBag:DisposeBag)  {
        BGView.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        BGView.CornerRadius(cornerRadius: CGFloat(cornerRadius))
       
        self.rx.controlEvent([.editingDidBegin]) //状态可以组合
            .asObservable()
            .subscribe(onNext: {   (_) in
                BGView.AddBorder(borderWidth: borderWidth, borderColor: borderColor)
            }).disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {
            (_) in
            BGView.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        }).disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEnd).subscribe(onNext: {
            (_) in
            BGView.AddBorder(borderWidth: borderWidth, borderColor: DefaultborderColor)
        }).disposed(by: disposeBag)
    }

}



public extension UIViewController{
    
    func SelectedHighlight(TFs:[UITextField],disposeBag:DisposeBag){
        TFs.forEach { tf in
            tf.selectedHighlightedSuperView (disposeBag:  disposeBag)
        }
    }
    
}


 
