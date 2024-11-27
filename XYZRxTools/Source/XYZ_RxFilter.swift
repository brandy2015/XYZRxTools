//
//  XYZ_RxFilter.swift
//  XYZRxTools
//
//  Created by zhangzihao on 2022/10/24.
//

import UIKit
import RxSwift

class XYZ_RxFilter: NSObject {
    
    let disposeBag = DisposeBag()

    
//        In this code, you:
//
//        Create a subject to model the data you want to work with, and another subject to act as a trigger.
//        Use skipUntil and pass the trigger subject. When trigger emits, skipUntil stops skipping.
//        Add a couple of next events onto subject:
//
//        subject.onNext("A")
//        subject.onNext("B")
//
//        Nothing is printed, because you’re skipping. Now add a new next event onto trigger:
//
//        trigger.onNext("X")
//
//        This causes skipUntil to stop skipping. From this point onward, all elements are let through. Add another next event onto subject:
//
//        subject.onNext("C")
//
//        Sure enough, it’s printed out:
//
//        --- Example of: skipUntil ---
//        C
    
    func trigger(){
        // 1
//        let subject = PublishSubject<String>()
//        let trigger = PublishSubject<String>()

        // 2
//        subject
//          .skipUntil(trigger)
//          .subscribe(onNext: {
//            print($0)
//          })
//          .disposed(by: disposeBag)
        
    }
      
    
///    Taking operators
    ///Taking is the opposite of skipping. When you want to take elements, RxSwift has you covered. The first taking operator you’ll learn about is take, which as this marble diagram depicts, will take the first of the number of elements you specified.
//    With this code, you:
//
//    Create an observable of integers.
//    Take the first 3 elements using take.
//    What you take is what you get. The output is:
//
//    --- Example of: take ---
//    1
//    2
//    3
    func TakeM(){
        
          let disposeBag = DisposeBag()

          // 1
          Observable.of(1, 2, 3, 4, 5, 6)
            // 2
            .take(3)
            .subscribe(onNext: {
              print($0)
            })
            .disposed(by: disposeBag)
       
    }
    
///    takeWhile
    ///
    func takeWhile(){
          let disposeBag = DisposeBag()

          // 1
          Observable.of(2, 2, 4, 4, 6, 6)

            // 2
            .enumerated()
            // 3
            .take(while: { index, integer in
                 
              // 4
              integer.isMultiple(of: 2) && index < 3
            })
            // 5
            
            .map(\.element)
            // 6
            .subscribe(onNext: {
              print($0)
            })
            .disposed(by: disposeBag)
        
//        --- Example of: takeWhile ---
//        2
//        2
//        4
    }
    
    func takeUntil(){
//        example(of: "takeUntil") {
//          let disposeBag = DisposeBag()

          // 1
//          Observable.of(1, 2, 3, 4, 5)
//            // 2
//            .takeUntil(.inclusive) { $0.isMultiple(of: 4) }
//            .subscribe(onNext: {
//              print($0)
//            })
//          .disposed(by: disposeBag)
//        }
//        --- Example of: takeUntil ---
//        1
//        2
//        3
//        4
    }
    
//
//    example(of: "takeUntil trigger") {
//      let disposeBag = DisposeBag()
//
//      // 1
//      let subject = PublishSubject<String>()
//      let trigger = PublishSubject<String>()
//
//      // 2
//      subject
//        .takeUntil(trigger)
//        .subscribe(onNext: {
//          print($0)
//        })
//        .disposed(by: disposeBag)
//
//      // 3
//      subject.onNext("1")
//      subject.onNext("2")
//    }
//
    
    
    
}
