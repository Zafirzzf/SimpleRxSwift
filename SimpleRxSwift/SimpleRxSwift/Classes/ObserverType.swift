//
//  ObserverType.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

protocol ObserverType {
    associatedtype E
    
    func on(_ event: Event<E>)
}


extension ObserverType {
    func onNext(_ element: E) {
        on(.next(element))
    }
    
    func onCompleted() {
        on(.completed)
    }
    
    func onError(_ error: Error) {
        on(.error(error))
    }
}
