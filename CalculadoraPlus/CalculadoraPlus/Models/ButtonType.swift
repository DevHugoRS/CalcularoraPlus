//
//  ButtonType.swift
//  30Dias
//
//  Created by Hugo Rodrigues on 14/02/25.
//

import Foundation
import SwiftUICore

enum ButtonType: Hashable, CustomStringConvertible {
    
    case digit(_ digit: Digit)
    case operation(_operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "±"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return .gray
        case .digit(_), .decimal:
            return .black
        case .equals:
            return .red
        case .operation(_):
            return .white
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent, .operation(_operation: ):
            return .black
        default:
            return .white
        }
    }
}
