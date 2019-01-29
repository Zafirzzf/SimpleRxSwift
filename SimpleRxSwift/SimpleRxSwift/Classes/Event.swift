//
//  Event.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/29.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

enum Event<E>: CustomDebugStringConvertible {
    case next(E)
    case completed
    case error(Error)
    
    var debugDescription: String {
        switch self {
        case .next(let element):
            return "\(element)"
        case .error(let error):
            return error.localizedDescription
        case .completed:
            return "序列结束的completed"
        }
    }
}
