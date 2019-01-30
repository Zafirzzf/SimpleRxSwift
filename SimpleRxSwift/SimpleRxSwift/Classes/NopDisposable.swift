//
//  NopDisposable.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation
/// Nop = No Operation
struct NopDisposable: Disposable {
    
    static let noOp: Disposable = NopDisposable()
    fileprivate init() {}
    
    func dispose() {
        // Do nothing
    }
}
