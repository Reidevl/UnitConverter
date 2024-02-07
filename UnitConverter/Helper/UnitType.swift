//
//  UnitType.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

enum UnitType: String, CaseIterable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case volume = "Volume"
    
    var getAllCases: [String] {
        switch self {
        case .temperature: return TemperatureUnits.allCases.map{$0.rawValue}
        case .length: return LengthUnits.allCases.map{$0.rawValue}
        case .time: return TimeUnits.allCases.map{$0.rawValue}
        case .volume: return VolumeUnits.allCases.map{$0.rawValue}
        }
    }
    
    var getInitialUnit: (input: String, output: String) {
        switch self {
        case .temperature: return (TemperatureUnits.celsius.rawValue, TemperatureUnits.kelvin.rawValue)
        case .length: return (LengthUnits.meter.rawValue, LengthUnits.feet.rawValue)
        case .time: return (TimeUnits.seconds.rawValue, TimeUnits.minutes.rawValue)
        case .volume: return (VolumeUnits.milliliters.rawValue, VolumeUnits.liters.rawValue)
        }
    }
}
