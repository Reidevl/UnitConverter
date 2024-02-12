//
//  OutputUnitView.swift
//  UnitConverter
//
//  Created by Reiwil Lugo on 12/2/24.
//

import SwiftUI

struct OutputUnitView: View {
    
    var convertedValue: Double
    var outputUnit: String
    
    var body: some View {
        Text("\(convertedValue.formatted()) \(outputUnit)")
    }
}

#Preview {
    OutputUnitView(convertedValue: 10, outputUnit: "ft")
}
