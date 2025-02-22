//
//  CalculadoraPlusApp.swift
//  CalculadoraPlus
//
//  Created by Hugo Rodrigues on 22/02/25.
//

import SwiftUI

@main
struct CalculadoraPlusApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
