//
//  Disposables.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

struct Disposables {
    static func create() -> Disposable {
        return NopDisposable.noOp
    }
}
