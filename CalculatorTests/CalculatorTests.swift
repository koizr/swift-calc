//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Koizumi on 2016/08/22.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalculator_init() {
        let target = Calculator()
        let result = target.calc()
        XCTAssert(result == "")
    }
    
    func testCalculator_clear() {
        let target = Calculator()
        target.clear()
        XCTAssert(target.calc() == "")
        target.inputNumber("1")
        target.inputOperator(.Plus)
        target.inputNumber("2")
        target.clear()
        XCTAssert(target.calc() == "")
    }
    
    func testCalculator_turnSign() {
        let target = Calculator()
        // empty
        XCTAssert(target.turnSign() == "0")
        // 0
        target.inputNumber("0")
        XCTAssert(target.turnSign() == "0")
        // lhs
        target.inputNumber("10")
        XCTAssert(target.turnSign() == "-10")
        XCTAssert(target.turnSign() == "10")
        // rhs
        target.inputOperator(.Plus)
        target.inputNumber("-2")
        XCTAssert(target.turnSign() == "2")
        XCTAssert(target.turnSign() == "-2")
        // calc
        XCTAssert(target.calc() == "8")
    }
    
    func testCalculator_percent() {
        let target = Calculator()
        // empty
        XCTAssert(target.percent() == "0")
        // lhs
        target.inputNumber("1")
        XCTAssert(target.percent() == "0.01")
        XCTAssert(target.percent() == "0.0001")
        target.inputOperator(.Plus)
        // rhs
        target.inputNumber("2")
        XCTAssert(target.percent() == "0.02")
        XCTAssert(target.percent() == "0.0002")
        // calc
        XCTAssert(target.calc() == "0.0003")
    }
    
    // TODO 境界値とか
    
    func testCalculator_input() {
        let target = Calculator()
        target.inputNumber("0")
        XCTAssert(target.calc() == "0")

        target.inputNumber("1")
        XCTAssert(target.calc() == "1")
        
        target.inputNumber(".")
        XCTAssert(target.calc() == "1.")

        target.clear()
        target.inputNumber("1.0")
        XCTAssert(target.calc() == "1.0")
        
        target.clear()
        target.inputNumber(".")
        XCTAssert(target.calc() == "0.")
    }
    
    func testCalculator_plus() {
        let target = Calculator()
        target.inputNumber("1")
        target.inputOperator(.Plus)
        target.inputNumber("10")
        XCTAssert(target.calc() == "11")
    }
    func testCalculator_minus() {
        let target = Calculator()
        target.inputNumber("1")
        target.inputOperator(.Minus)
        target.inputNumber("10")
        XCTAssert(target.calc() == "-9")
    }
    func testCalculator_times() {
        let target = Calculator()
        target.inputNumber("1")
        target.inputOperator(.Times)
        target.inputNumber("10")
        XCTAssert(target.calc() == "10")
    }
    func testCalculator_divide() {
        let target = Calculator()
        target.inputNumber("1")
        target.inputOperator(.Divided)
        target.inputNumber("10")
        XCTAssert(target.calc() == "0.1")
        //  x / 0
        target.clear()
        target.inputNumber("1")
        target.inputOperator(.Divided)
        target.inputNumber("0")
        XCTAssert(target.calc() == "Error")
    }
    
    func testCalculator_changeOperator() {
        let target = Calculator()
        target.inputNumber("1")
        target.inputOperator(.Plus)
        target.inputOperator(.Minus)
        target.inputNumber("100")
        XCTAssert(target.calc() == "-99")
    }
}
