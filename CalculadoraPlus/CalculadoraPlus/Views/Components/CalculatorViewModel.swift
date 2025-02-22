//
//  CalculatorViewModel.swift
//  30Dias
//
//  Created by Hugo Rodrigues on 19/02/25.
//

import Foundation
import Combine

extension CalculatorView {
    final class ViewModel: ObservableObject {
//        MARK: - Propeties
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            [[.allClear, .negative, .percent, .operation(_operation: .division)],
             [.digit(.seven), .digit(.eight), .digit(.nine), .operation(_operation: .multiplication)],
             [.digit(.four), .digit(.five), .digit(.six), .operation(_operation: .subtraction)],
             [.digit(.one), .digit(.two), .digit(.three), .operation(_operation: .addition)],
             [.digit(.zero), .decimal, .equals]]
        }
        
//        MARK: - Actions
        
        func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            }
        }
        
//        MARK: - Helpers
        
//        Checks if current buttonType of type .arithmeticOperation is active
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else { return false }
            return calculator.operationIsHighlighted(operation)
        } 
    }
}
