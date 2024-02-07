//
//  LenghtUnits.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

enum LengthUnits: String, CaseIterable, UnitConvertible {
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
}
