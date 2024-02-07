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
                    Text("\(viewModel.unitType.rawValue)")
                    Picker("Select the unit type", selection: $viewModel.unitType) {
                        ForEach(UnitType.allCases, id: \.self) { unit in
                            Text("\(unit.rawValue)")
                        }
                    }
                    .onChange(of: viewModel.unitType) {
                        let types = viewModel.unitType.getInitialUnit
                        viewModel.inputUnit = types.input
                        viewModel.outputUnit = types.output
                    }
                }
                
                Section {
                    TextField("Enter a value", value: $viewModel.inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($unitIsFocused)
                    
                    Picker("Select the input Unit", selection: $viewModel.inputUnit) {
                        ForEach(viewModel.unitType.getAllCases, id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Select the output Unit", selection: $viewModel.outputUnit) {
                        ForEach(viewModel.unitType.getAllCases, id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output value") {
                    Text("\(viewModel.convertedValue.formatted()) \(viewModel.outputUnit)")
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
