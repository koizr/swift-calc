//
//  Selector+UIEvent.swift
//  Calculator
//
//  Created by Koizumi on 2017/02/04.
//  Copyright © 2017年 Koizumi. All rights reserved.
//

import Foundation

extension Selector {

    /** Event of tapped Number Button */
    static let numberButtonTapped = #selector(ViewController.inputToCalc(_:))
    
    /** Event of tapped Operator Button */
    static let operatorButtonTapped = #selector(ViewController.inputToCalc(_:))
    
    /** Event of tapped Operator Button */
    static let controlButtonTapped = #selector(ViewController.controlCalc(_:))
    
}
