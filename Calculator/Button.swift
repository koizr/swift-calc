//
//  Button.swift
//  Calculator
//
//  Created by Koizumi on 2017/02/04.
//  Copyright © 2017年 Koizumi. All rights reserved.
//

import Foundation

enum Button {
    enum Number : Int {
        case DOUBLE_ZERO = 10
        case ZERO = 0
        case ONE = 1
        case TWO = 2
        case THREE = 3
        case FOUR = 4
        case FIVE = 5
        case SIX = 6
        case SEVEN = 7
        case EIGHT = 8
        case NINE = 9
        case DecimalPoint = -1
    }
    
    enum Operator : Int {
        case Plus = 100
        case Minus = 101
        case Times = 102
        case Divided = 103
        
    }
    
    enum Control : Int {
        case Equal = 200
        case TurnSign = 201
        case Percent = 202
        
    }
}
