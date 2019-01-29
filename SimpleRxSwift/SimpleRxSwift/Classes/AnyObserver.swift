//
//  Observer.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

struct AnyObserver<E>: ObserverType {
    
    typealias EventHandler = (Event<E>) -> Void
    
    // 可见, 观察者其实就是个 闭包类型的 事件/函数 只不过我们可以包装为一个结构体
    private let observer: EventHandler
    
    init(eventHandler: @escaping EventHandler) {
        self.observer = eventHandler
    }
    
    init<O: ObserverType>(_ observer: O) where O.E == E {
        // 将一个 func on() 函数赋值给闭包    函数 == 闭包
        self.observer = observer.on
    }
    
    func on(_ event: Event<E>) {
        self.observer(event)
    }
    
    
}
