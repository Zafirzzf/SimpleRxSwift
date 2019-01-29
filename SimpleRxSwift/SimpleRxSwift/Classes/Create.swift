//
//  Create.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

extension ObservableType {
    static func create(_ subscribe: @escaping (AnyObserver<E>) -> Disposable) -> Observable<E> {
        return AnonymousObservable(subscribeHandler: subscribe)
    }
}

class AnonymounsObservableSink<O: ObserverType>: Sink<O>, ObserverType {
    typealias E = O.E
    typealias Parent = AnonymousObservable<E>

    /// 在通过create注册的闭包的observer参数执行onNext时, 执行此函数
    /// forwardOn是对当前引用的AnyObserver,调用on,而AnyObserver.on,即是eventHandler
    func on(_ event: Event<O.E>) {
        switch event {
        case .next(let element):
            forwardOn(event)
        case .error(let _ ), .completed:
            forwardOn(event)
            dispose()
        }
    }
    
    func run(_ parent: Parent) -> Disposable {
        /// 此Handler为 2s后对observer参数进行onNext操作 - onNext - 调用 on(_ event)
        /// 这句就是执行这个闭包的意思了
        /// 
        return parent._subscribeHandler(AnyObserver(self))
    }
    
}
class AnonymousObservable<E> : Producer<E> {
 
    typealias SubscribeHandler = (AnyObserver<E>) -> Disposable
    
  
    let _subscribeHandler: SubscribeHandler
    
    init(subscribeHandler: @escaping SubscribeHandler) {
        _subscribeHandler = subscribeHandler
    }
    
    /// 调用subscribe方法时调用
    /// observer - eventHandler { print元素 }
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == E {
    
        let sink = AnonymounsObservableSink(observer: observer, cancel: cancel)
        let subscription = sink.run(self)
        return (sink: sink, subscription: subscription)
    }
}
