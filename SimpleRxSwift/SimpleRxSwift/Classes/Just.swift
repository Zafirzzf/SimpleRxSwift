//
//  Just.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

extension ObservableType {
    static func just(_ element: E) -> Observable<E> {
        return Just<E>(element)
    }
}

class Just<E>: Producer<E> {
    private let _element: E
    init(_ element: E) {
        _element = element
    }
    
    override func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        observer.onNext(_element)
        observer.onCompleted()
        return Disposables.create()
    }
}
