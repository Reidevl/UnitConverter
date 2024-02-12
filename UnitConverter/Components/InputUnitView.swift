//
//  InputUnitView.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 8/2/24.
//

import SwiftUI

struct InputUnitView: View {
    @FocusState var unitIsFocused: Bool
    @Binding var inputValue: Double?
    @Binding var inputUnit: String
    @Binding var outputUnit: String
    let allCases: [String]
    
    var body: some View {
            TextField("Enter a value", value: $inputValue, format: .number)
                .keyboardType(.decimalPad)
                .focused($unitIsFocused)
            
            Picker("Select the input Unit", selection: $inputUnit) {
                ForEach(allCases, id: \.self) { unit in
                    Text("\(unit)")
                }
            }
            .pickerStyle(.segmented)
            
            Picker("Select the output Unit", selection: $outputUnit) {
                ForEach(allCases, id: \.self) { unit in
                    Text("\(unit)")
                }
            }
            .pickerStyle(.segmented)
    }
}

#Preview {
    let inputValue = Binding<Double?>(get: { 10 }, set: { _ in })
    let inputUnit = Binding<String>(get: { "m" }, set: { _ in })
    let outputUnit = Binding<String>(get: { "ft" }, set: { _ in })
    let allCases: [String] = ["m", "Km", "ft", "yd", "mi"]

    @FocusState var unitIsFocused: Bool
    
    return Group {
        InputUnitView(unitIsFocused: _unitIsFocused, inputValue: inputValue, inputUnit: inputUnit, outputUnit: outputUnit, allCases: allCases)
    }
}
