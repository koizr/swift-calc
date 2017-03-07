//
//  Number.swift
//  Calculator
//
//  Created by Koizumi on 2016/08/24.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import Foundation

/*
 This class is Number for calculating
 */
public class Number : Equatable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    private static let ZERO : String = "0"
    
    private static let EMPTY : String = ""
    
    public static let DECIMAL_POINT : String = "."

    private var value : String
    
    public var stringValue : String {
        return value
    }
    
    public var doubleValue : Double {
        return Double(value) ?? 0
    }
    
    /**
     return ture if value is empty.
     */
    public var isEmpty : Bool {
        return value.isEmpty
    }

    /**
     return true if be DISABLE to append double zero to self.
     */
    private var isDisableToAppendDoubleZero : Bool {
        return value.isEmpty || value == Number.ZERO
    }
    
    public init() {
        value = Number.EMPTY
    }

    public init(_ number: Double) {
        self.value = number.toStringWithoutZeroDecimal()
    }
    
    /**
     initialize by Integer Literal
     - parameter value : Integer
     */
    public required init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
    
    /**
     initialize by Float Literal
     - parameter value : Float
     */
    public required init(floatLiteral value: FloatLiteralType) {
        self.value = value.toStringWithoutZeroDecimal()
    }
    
    /** add num */
    public func add(_ num: Number) {
        let added = self.doubleValue + num.doubleValue
        self.value = added.toStringWithoutZeroDecimal()
    }

    /** subtract num */
    public func subtract(_ num: Number) {
        let substructed = self.doubleValue - num.doubleValue
        self.value = substructed.toStringWithoutZeroDecimal()
    }
    
    /** multiply num */
    public func multiply(_ num: Number) {
        let multiplied = self.doubleValue * num.doubleValue
        self.value = multiplied.toStringWithoutZeroDecimal()
    }
    
    /** divide num */
    public func divide(_ num: Number) {
        let divided = self.doubleValue / num.doubleValue
        self.value = divided.toStringWithoutZeroDecimal()
    }

    /* override operator */
    public static func + (left: Number, right: Number) -> Number {
        return Number(left.doubleValue + right.doubleValue)
    }
    public static func - (left: Number, right: Number) -> Number {
        return Number(left.doubleValue - right.doubleValue)
    }
    public static func * (left: Number, right: Number) -> Number {
        return Number(left.doubleValue * right.doubleValue)
    }
    public static func / (left: Number, right: Number) -> Number {
        return Number(left.doubleValue / right.doubleValue)
    }
    public static func == (left: Number, right: Number) -> Bool {
        return left.doubleValue == right.doubleValue
    }
    
    /**
     invert sign.
     */
    public func invert() {
        let inverted = self.doubleValue * -1
        self.value = inverted.toStringWithoutZeroDecimal()
    }
    
    /**
     append parameter s :
     if self will be number then append s to self,
     else never append s.
     引数sをappendした結果、数値になるならappendする
     数値にならないなら何もしない
     - parameter s : 追加する文字列
     */
    @discardableResult
    public func append(_ s: String) -> Number {
        var newValue : String?

        if value.isEmpty && Number.DECIMAL_POINT == s {
            newValue = Number.ZERO + Number.DECIMAL_POINT
        } else if s == "00" && self.isDisableToAppendDoubleZero {
            newValue = Number.ZERO
        } else {
            newValue = value == Number.ZERO ? s : value + s
        }

        newValue.then() {
            if let _ = Double($0) {
                self.value = $0
            }
        }
        return self
    }
    
}
