//
//  Calculator.swift
//  30Dias
//
//  Created by Hugo Rodrigues on 19/02/25.
//

import Foundation


struct Calculator {
    
    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtraction:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            }
        }
    }
    //    MARK: - Properties
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            pressedClear = false
        }
    }
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var carryingZeroCount: Int = 0
    
    private var pressedClear: Bool = false
    
//    MARK: - Computed Properties
    
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    var showAllClear: Bool {
        newNumber == nil && expression == nil && result == nil || pressedClear
    }
        
    var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    
    // MARK: - COMPUTED PROPERTIES

    mutating func setDigit(_ digit: Digit) {
        //1.
        guard canAddDigit(digit) else { return }
        //2.
        let numberString = getNumberString(forNumber: newNumber)
        //3.
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        //1.
        guard var number = newNumber ?? result else { return }
        //2.
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        //3.
        expression = ArithmeticExpression(number: number, operation: operation)
        //4.
        newNumber = nil
        
    }
    
    mutating func toggleSign() {
        
    }
    
    mutating func setPercent() {
        // 1.
        if let number = newNumber {
            // 2.
            newNumber = number / 100
            return
        }
        
        // 1.
        if let number = result {
            // 2.
            result = number / 100
            return
        }
    }
    
    mutating func setDecimal() {
        
    }
    
    mutating func evaluate() {
        // 1.
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        // 2.
        result = expressionToEvaluate.evaluate(with: number)
        // 3.
        expression = nil
        newNumber = nil
    }
    
    mutating func allClear() {
        
    }
    
    mutating func clear() {
        
    }
//    MARK: - Helpers
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        return (withCommas ? number? .formatted(.number) : number.map(String.init)) ?? "0"
    }
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
}
