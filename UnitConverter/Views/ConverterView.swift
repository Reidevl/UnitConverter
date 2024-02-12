//
//  ConverterView.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import SwiftUI

struct ConverterView: View {
    @StateObject var viewModel: ViewModel = .init()
    @FocusState private var unitIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    UnitTypeSelectorView(unitType: $viewModel.unitType, inputUnit: $viewModel.inputUnit, outputUnit: $viewModel.outputUnit)
                }
                
                Section {
                    InputUnitView(unitIsFocused: _unitIsFocused, inputValue: $viewModel.inputValue, inputUnit: $viewModel.inputUnit, outputUnit: $viewModel.outputUnit, allCases: viewModel.unitType.getAllCases)
                }
                
                Section("Output value") {
                    OutputUnitView(convertedValue: viewModel.convertedValue, outputUnit: viewModel.outputUnit)
                }
            }
            .navigationTitle("Units Converter")
            .toolbar {
                if unitIsFocused {
                    Button("Done") {
                        unitIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ConverterView()
}
