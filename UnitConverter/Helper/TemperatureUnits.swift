//
//  TemperatureUnits.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

enum TemperatureUnits: String, CaseIterable, UnitConvertible {
    case celsius = "C"
    case fahrenheit = "F"
    case kelvin = "K"
    
    var conversionFactorToBaseUnit: Double {
        switch self {
            case .celsius: return 1
            case .fahrenheit: return 1.8
            case .kelvin: return 1
        }
    }
    
    func convertToBaseUnitTemp(to value: Double) -> Double {
        switch self {
            case .fahrenheit:
                return (value - 32) * (5/9)
            case .kelvin:
                return value - 273.15
            default:
                return value
        }
    }
        
    func convertFromBaseUnitTemp(from value: Double) -> Double {
        switch self {
            case .fahrenheit:
                return (value * (9/5)) + 32
            case .kelvin:
                return value + 273.15
            default:
                return value
        }
    }
}
