//
//  Sink.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

class Sink<O: ObserverType>: Disposable {

    private let _observer: O
    private let _cancel: Cancelable
    private var _disposed: Bool
    
    init(observer: O, cancel: Cancelable) {
        _observer = observer
        _cancel = cancel
        _disposed = false
    }
    
    func forwardOn(_ event: Event<O.E>) {
        guard !_disposed else { return }
        _observer.on(event)
    }
    
    func dispose() {
        _disposed = true
        _cancel.dispose()
    }
}
