//
//  Calculator.swift
//  Calculator
//
//  Created by Koizumi on 2016/10/02.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import Foundation

public class Calculator {

    /** left hand side */
    private var left : Number

    /** right hand side */
    private var right : Number
    
    /** operator */
    private var operation : Operator
    
    /** status */
    private var status : Status {
        // TODO ステータス使いたい
        // でもそもそも数値と演算子のステータスを同時に扱うのが間違いだったかも
        if self.operation == .None {
            return .LeftInputWaiting
        }
        if self.right.isEmpty {
            return .RightInputWaiting
        } else {
            return .Calculable
        }
    }
    
    public init() {
        self.left = Number()
        self.right = Number()
        self.operation = .None
    }
    
    /**
     入力値を初期化する。
     */
    public func clear() {
        self.left = Number()
        self.right = Number()
        self.operation = .None
    }
    
    /**
     入力値を設定する
     input number
     - parameter val : 入力値
     */
    @discardableResult
    public func inputNumber(_ val : String) -> String {
        if operation == .None {
            left.append(val)
            return left.stringValue
        } else {
            right.append(val)
            return right.stringValue
        }
    }
    
    /**
     演算子を入力する
     input operator
     - parameter val : 入力値
     */
    public func inputOperator(_ val : Operator) {
        if operation == .None {
            if left.isEmpty {
                left = 0
            }
            operation = val
        } else if right.isEmpty {
            operation = val
        } else {
            calc()
            operation = val
        }
    }
    
    /**
     符号を反転する
     invert current target Number's sign.
     */
    @discardableResult
    public func turnSign() -> String {
        if operation == .None {
            left.multiply(-1)
            return left.stringValue
        } else {
            right.multiply(-1)
            return right.stringValue
        }
    }
    
    /**
     対象の値を百分率にする
     */
    @discardableResult
    public func percent() -> String {
        if operation == .None {
            if !left.isEmpty {
                left.divide(100)
            }
            return left.stringValue
        } else {
            if !right.isEmpty {
                right.divide(100)
            }
            return right.stringValue
        }
    }
    
    /**
     ステータスが計算可能状態であれば計算結果を返す。
     計算可能状態でなければステータスに応じた表示値を返す。
     - returns : 計算結果
     */
    @discardableResult
    public func calc() -> String {
        if operation == .None || right.isEmpty {
            return left.stringValue
        }

        var result : Number? = nil
        switch operation {
        case .Plus:
            result = left + right
        case .Minus:
            result = left - right
        case .Times:
            result = left * right
        case .Divided:
            if right.doubleValue == 0 {
                clear()
                return "Error"
            }
            result = left / right
        default:
            break
        }
        
        result.then() {
            clear()
            left = $0
        }
        return left.stringValue
    }

}
