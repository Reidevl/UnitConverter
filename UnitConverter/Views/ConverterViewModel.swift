//
//  ConverterViewModel.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputValue: Double? = nil
    @Published var unitType: UnitType = .length
    
    @Published var inputUnit = LengthUnits.meter.rawValue
    @Published var outputUnit = LengthUnits.feet.rawValue
    
    var convertedValue: Double {
        guard let userInputValue = inputValue else { return 0 }
        
        var valueInBaseUnit: Double
        var outputValue: Double
        
        switch unitType {
        case .temperature:
            valueInBaseUnit = TemperatureUnits(rawValue: inputUnit)?.convertToBaseUnitTemp(to: userInputValue) ?? 0
            outputValue = TemperatureUnits(rawValue: outputUnit)?.convertFromBaseUnitTemp(from: valueInBaseUnit) ?? 0
        case .length:
            valueInBaseUnit = LengthUnits(rawValue: inputUnit)?.convertToBaseUnit(to: userInputValue) ?? 0
            outputValue = LengthUnits(rawValue: outputUnit)?.convertFromBaseUnit(from: valueInBaseUnit) ?? 0
        case .time:
            valueInBaseUnit = TimeUnits(rawValue: inputUnit)?.convertToBaseUnit(to: userInputValue) ?? 0
            outputValue = TimeUnits(rawValue: outputUnit)?.convertFromBaseUnit(from: valueInBaseUnit) ?? 0
        case .volume:
            valueInBaseUnit = VolumeUnits(rawValue: inputUnit)?.convertToBaseUnit(to: userInputValue) ?? 0
            outputValue = VolumeUnits(rawValue: outputUnit)?.convertFromBaseUnit(from: valueInBaseUnit) ?? 0
        }
        return outputValue
    }
}
