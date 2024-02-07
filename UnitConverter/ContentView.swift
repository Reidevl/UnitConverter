//
//  ContentView.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import SwiftUI

enum LengthUnit: String, CaseIterable {
    case meter = "m"
    case kilometer = "Km"
    case feet = "ft"
    case yards = "yd"
    case miles = "mi"
    
    var conversionFactorToBaseUnit: Double {
        switch self {
            case .meter: return 1
            case .kilometer: return 1000
            case .feet: return 0.3048
            case .yards: return 0.9144
            case .miles: return 1609.34
        }
    }
    
    func convertToBaseUnit(to value: Double) -> Double {
        return value * conversionFactorToBaseUnit
    }
    
    func convertFromBaseUnit(from value: Double ) -> Double {
        return value / conversionFactorToBaseUnit
    }
}

struct ContentView: View {
    @State private var inputValue: Double? = nil
    @State private var inputUnit: LengthUnit = .meter
    @State private var outputUnit: LengthUnit = .feet
    @FocusState private var unitIsFocused: Bool
    
    var corvertedValue: Double {
        guard let userInputValue = inputValue else { return 0 }
        
        let valueInBaseUnit = inputUnit.convertToBaseUnit(to: userInputValue)
        let outputValue = outputUnit.convertFromBaseUnit(from: valueInBaseUnit)
        
        return outputValue
    
//    var covertToBaseUnit: Double {
//        let userInputValue = Double(inputValue ?? 0)
//        let userInputUnit = inputUnit
//        
//        switch userInputUnit {
//        case .kilometer:
//            return Double(userInputValue * 1000)
//        case .feet:
//            return Double(userInputValue * 0.3048)
//        case .yards:
//            return Double(userInputValue * 0.9144)
//        case .miles:
//            return Double(userInputValue * 1609.34 )
//        default:
//            return userInputValue
//        }
//    }
//    
//    
//    var outputValue: Double {
//        let userConvertedValue = covertToBaseUnit
//        let userOutputUnit = outputUnit
//        
//        switch userOutputUnit {
//        case .kilometer:
//            return Double(userConvertedValue / 1000)
//        case .feet:
//            return Double(userConvertedValue / 0.3048)
//        case .yards:
//            return Double(userConvertedValue / 0.9144)
//        case .miles:
//            return Double(userConvertedValue / 1609.34 )
//        default:
//            return userConvertedValue
//        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter a value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($unitIsFocused)
                    
                    Picker("Select the input Unit", selection: $inputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text("\(unit.rawValue)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Select the output Unit", selection: $outputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text("\(unit.rawValue)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output value") {
                    Text("\(corvertedValue.formatted()) \(outputUnit.rawValue)")
                }
            }
            .navigationTitle("Length Converter")
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
    ContentView()
}
