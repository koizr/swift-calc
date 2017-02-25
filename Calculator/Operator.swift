//
//  Operator.swift
//  Calculator
//
//  Created by Koizumi on 2016/10/07.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import Foundation

/**
 演算子を表すenum
 TODO UI.Button.Operator と被ってるから統合したい
 */
public enum Operator {
    case None
    case Plus
    case Minus
    case Times
    case Divided
    
    case Equal
    case TurnSign
}
