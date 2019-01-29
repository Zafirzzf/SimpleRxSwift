//
//  Observable.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation
/// 基类序列
class Observable<E>: ObservableType {

    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        fatalError("基类的抽象方法")
    }
    
    func asObservable() -> Observable<E> {
        return self
    }
}
