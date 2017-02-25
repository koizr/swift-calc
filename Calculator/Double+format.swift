//
//  Double+format.swift
//  Calculator
//
//  Created by Koizumi on 2017/02/19.
//  Copyright © 2017年 Koizumi. All rights reserved.
//

import Foundation

extension Double {
    
    /**
     return value of converted self to String.
     */
    func toStringWithoutZeroDecimal() -> String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(self))
        }
        return String(self)
    }

}
