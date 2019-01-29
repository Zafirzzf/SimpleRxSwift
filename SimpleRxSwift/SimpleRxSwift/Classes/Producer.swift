//
//  Producer.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

class Producer<E>: Observable<E> {
    override init() {
        super.init()
    }
    
    override func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        let disposer = SinkDisposer()
        let sinkAndSubscription = self.run(observer, cancel: disposer)
        return disposer
    }
    
    func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == E {
        fatalError("基类抽象方法")
    }
}

fileprivate class SinkDisposer: Cancelable {
    
//    private var _state = dispos
    
    var isDisposed: Bool {
        return false
    }
    
    func dispose() {
        
    }
    
    enum DisposeState: Int32 {
        case disposed = 1
        case sinkAndSubscriptionSet = 2
    }
}
