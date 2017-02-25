//
//  UIButton+onTap.swift
//  Calculator
//
//  Created by Koizumi on 2017/02/04.
//  Copyright © 2017年 Koizumi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    /*
     add action to Button's tap event.
     - parameter target : the Instance in which is On Tap Events occurs.
     - parameter action : action type Selector.
     */
    func onTap(_ target : Any?, action : Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }

    func isNumberButton() -> Bool {
        return self.tag <= 10
    }
    
    func isOperationButton() -> Bool {
        return self.tag >= 100
    }
}
