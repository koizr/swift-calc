//
//  Status.swift
//  Calculator
//
//  Created by Koizumi on 2016/10/17.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import Foundation

// 計算機の状態を表すenum
enum Status {

    // 左辺入力待ち
    case LeftInputWaiting
    
    // 演算子入力待ち
    case OperatorInputWaiting
    
    // 右辺入力待ち
    case RightInputWaiting
    
    // 計算可能
    case Calculable

}
