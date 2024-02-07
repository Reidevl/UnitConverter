//
//  VolumeUnits.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

enum VolumeUnits: String, CaseIterable, UnitConvertible {
    case milliliters = "ml"
    case liters = "L"
    case pints = "pt"
    case quarts = "qt"
    case gallons = "gal"
    
    var conversionFactorToBaseUnit: Double {
        switch self {
            case .milliliters: return 1
            case .liters: return 1000
            case .pints: return 473.176
            case .quarts: return 946.353
            case .gallons: return 3785.41
        }
    }
}
