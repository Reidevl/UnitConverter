//
//  UnitConversor.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

protocol UnitConvertible {
    // It will allow us to convert an input value to a default unit and then makes the conversion
    var conversionFactorToBaseUnit: Double { get }
    
    func convertToBaseUnit(to value: Double) -> Double
    func convertFromBaseUnit(from value: Double ) -> Double
}

extension UnitConvertible {
    func convertToBaseUnit(to value: Double) -> Double {
        return value * conversionFactorToBaseUnit
    }
    
    func convertFromBaseUnit(from value: Double ) -> Double {
        return value / conversionFactorToBaseUnit
    }
}
