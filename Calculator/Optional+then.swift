//
//  Optional+then.swift
//  Calculator
//
//  Created by Koizumi on 2017/02/21.
//  Copyright © 2017年 Koizumi. All rights reserved.
//

import Foundation

extension Optional {
    /**
     execute closure if there is self
     */
    func then(_ handler: (Wrapped) -> Void) {
        switch self {
        case .some(let wrapped): return handler(wrapped)
        case .none: break
        }
    }
}
