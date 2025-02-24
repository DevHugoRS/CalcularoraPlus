//
//  CalculatorView.swift
//  30Dias
//
//  Created by Hugo Rodrigues on 14/02/25.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
//        MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .black, .gray], startPoint: .topTrailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                displayText
                buttonPad
            }
            .padding(Constants.padding)
        }
    }
}
//        MARK: - Previews
#Preview {
    CalculatorView()
        .environmentObject(CalculatorView.ViewModel())
}

extension CalculatorView {
    
//        MARK: - DisplayText
    private var displayText: some View {
        Text(viewModel.displayText)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 88, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
        }
        
//        MARK: - Todos: ButtonPad
        private var buttonPad: some View {
            VStack(spacing: Constants.padding) {
                ForEach(viewModel.buttonTypes, id: \.self) { row in
                    HStack(spacing: Constants.padding) {
                        ForEach(row, id: \.self) { buttonType in
                            CalculatorButton(buttonType: buttonType)
                        }
                    }
                }
            }
            .padding()
        }
    }
