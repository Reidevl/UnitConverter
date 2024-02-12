//
//  UnitTypeSelectorView.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 12/2/24.
//

import SwiftUI

struct UnitTypeSelectorView: View {
    @Binding var unitType: UnitType
    @Binding var inputUnit: String
    @Binding var outputUnit: String
    
    var body: some View {
        Picker("Select the unit type", selection: $unitType) {
            ForEach(UnitType.allCases, id: \.self) { unit in
                Text("\(unit.rawValue)")
            }
        }
        .onChange(of: unitType) {
            let types = unitType.getInitialUnit
            inputUnit = types.input
            outputUnit = types.output
        }
    }
}

#Preview {
    let unitType = Binding<UnitType>(get: {.length}, set: {_ in})
    let inputUnit = Binding<String>(get: { "m" }, set: { _ in })
    let outputUnit = Binding<String>(get: { "ft" }, set: { _ in })
    
    return Group {
        UnitTypeSelectorView(unitType: unitType , inputUnit: inputUnit, outputUnit: outputUnit)
    }
}
