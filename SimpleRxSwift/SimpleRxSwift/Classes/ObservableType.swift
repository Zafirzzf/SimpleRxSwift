//
//  ObservableType.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

protocol ObservableType: ObservableConvertibleType {
    
    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E
}

extension ObservableType {
    func asObservable() -> Observable<E> {
        return  Observable.create({ (o) -> Disposable in
            return self.subscribe(o)
        })
    }
}


