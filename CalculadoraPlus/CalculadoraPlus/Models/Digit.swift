//
//  Digit.swift
//  30Dias
//
//  Created by Hugo Rodrigues on 15/02/25.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
