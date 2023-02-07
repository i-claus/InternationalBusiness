//
//  Double+extension.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 04.02.23.
//

import Foundation



extension Double {
    func removeTrailingZeros() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        formatter.minimumIntegerDigits = 1
        formatter.paddingPosition = .beforeSuffix
        formatter.paddingCharacter = " "
        formatter.formatWidth = 0
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    
    func bankersRounding(toPlaces places: Int) -> Double {
        let factor = pow(10.0, Double(places))
        let roundedValue = (self * factor).rounded() / factor
        return roundedValue
    }
}
