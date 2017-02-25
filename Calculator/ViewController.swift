//
//  ViewController.swift
//  Calculator
//
//  Created by Koizumi on 2016/08/22.
//  Copyright © 2016年 Koizumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    /* the Label View is to display a calculation result  */
    @IBOutlet weak var result: UILabel!
    
    /* Number Buttons */
    @IBOutlet weak var number00: UIButton!
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var decimalPoint: UIButton!
    
    /* Operator Buttons */
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var timesButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var turnSignButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    private let calc : Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // add tap event to Number Button
        number0.tag = Button.Number.ZERO.rawValue
        number0.onTap(self, action: .numberButtonTapped)
        number1.tag = Button.Number.ONE.rawValue
        number1.onTap(self, action: .numberButtonTapped)
        number2.tag = Button.Number.TWO.rawValue
        number2.onTap(self, action: .numberButtonTapped)
        number3.tag = Button.Number.THREE.rawValue
        number3.onTap(self, action: .numberButtonTapped)
        number4.tag = Button.Number.FOUR.rawValue
        number4.onTap(self, action: .numberButtonTapped)
        number5.tag = Button.Number.FIVE.rawValue
        number5.onTap(self, action: .numberButtonTapped)
        number6.tag = Button.Number.SIX.rawValue
        number6.onTap(self, action: .numberButtonTapped)
        number7.tag = Button.Number.SEVEN.rawValue
        number7.onTap(self, action: .numberButtonTapped)
        number8.tag = Button.Number.EIGHT.rawValue
        number8.onTap(self, action: .numberButtonTapped)
        number9.tag = Button.Number.NINE.rawValue
        number9.onTap(self, action: .numberButtonTapped)
        number00.tag = Button.Number.DOUBLE_ZERO.rawValue
        number00.onTap(self, action: .numberButtonTapped)
        decimalPoint.tag = Button.Number.DecimalPoint.rawValue
        decimalPoint.onTap(self, action: .numberButtonTapped)
        // add event to Operator Button
        plusButton.tag = Button.Operator.Plus.rawValue
        plusButton.onTap(self, action: .operatorButtonTapped)
        minusButton.tag = Button.Operator.Minus.rawValue
        minusButton.onTap(self, action: .operatorButtonTapped)
        timesButton.tag = Button.Operator.Times.rawValue
        timesButton.onTap(self, action: .operatorButtonTapped)
        divideButton.tag = Button.Operator.Divided.rawValue
        divideButton.onTap(self, action: .operatorButtonTapped)
        percentButton.tag = Button.Control.Percent.rawValue
        percentButton.onTap(self, action: .controlButtonTapped)
        turnSignButton.tag = Button.Control.TurnSign.rawValue
        turnSignButton.onTap(self, action: .controlButtonTapped)
        equalButton.tag = Button.Control.Equal.rawValue
        equalButton.onTap(self, action: .controlButtonTapped)
        
        result.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func controlCalc(_ contorller : UIButton) {
        switch contorller.tag {
        case Button.Control.Equal.rawValue:
            result.text = calc.calc()
        case Button.Control.Percent.rawValue:
            result.text = calc.percent()
        case Button.Control.TurnSign.rawValue:
            result.text = calc.turnSign()
        default:
            break
        }
    }
    
    /*
     input number or operator to Caluculator
     - on : tapped button
     */
    func inputToCalc(_ tappedButton: UIButton) {
        let buttonTag = tappedButton.tag
        if tappedButton.isNumberButton() {
            
            switch buttonTag {
            case Button.Number.DOUBLE_ZERO.rawValue:
                result.text = calc.inputNumber("00")
                
            case Button.Number.DecimalPoint.rawValue:
                result.text = calc.inputNumber(Number.DECIMAL_POINT)
                
            default:
                result.text = calc.inputNumber(String(buttonTag))
            }
            
        } else if tappedButton.isOperationButton() {
            
            switch buttonTag {
            case Button.Operator.Plus.rawValue:
                calc.inputOperator(.Plus)
                
            case Button.Operator.Minus.rawValue:
                calc.inputOperator(.Minus)
                
            case Button.Operator.Times.rawValue:
                calc.inputOperator(.Times)
                
            case Button.Operator.Divided.rawValue:
                calc.inputOperator(.Divided)
                
            default:
                break
            }
        }
    }
    
    /*
     clear Caluclator.
     - on : tapped AC button
     */
    @IBAction func allClear(_ sender: UIButton) {
        calc.clear()
        result.text = "0"
    }
    
}

