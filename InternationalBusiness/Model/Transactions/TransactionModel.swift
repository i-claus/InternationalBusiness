//
//  TransactionModel.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation


struct TransactionModel : Codable, Hashable {
    let sku : String
    let amount : Double
    let currency : String
    
    var euroValue : Double {
          let conversionRate = CurrencyHelper.getConversionRate(from: currency, to: "EUR")
          let value = amount * conversionRate
        return value.bankersRounding(toPlaces: 2)
      }
    
    var euroValueString : String {
       "\( euroValue.removeTrailingZeros()) EUR"
    }
}
