//
//  TimeUnits.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 7/2/24.
//

import Foundation

enum TimeUnits: String, CaseIterable, UnitConvertible {
    case seconds = "sec"
    case minutes = "min"
    case hours = "hour"
    case days = "day"
    case weeks = "week"
    
    var conversionFactorToBaseUnit: Double {
        switch self {
            case .seconds: return 1
            case .minutes: return 60
            case .hours: return 3600
            case .days: return 86400
            case .weeks: return 604800
        }
    }
}
