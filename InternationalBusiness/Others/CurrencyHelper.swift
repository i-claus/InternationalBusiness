//
//  CurrencyHelper.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 04.02.23.
//

import Foundation



class CurrencyHelper {
    
    static var rates : [RatesModel] = []
    
    @MainActor
    static func fetchLatestRates() async throws {
        let task = RatesTask()
        rates = try await APIClient().execute(task: task)
    }
 
    
    static func getConversionRate(from: String, to: String) -> Double {
        let directRate = rates.first(where: { $0.from == from && $0.to == to })
        if let directRate {
            return directRate.rate
        } else if from == to {
            return 1
        } else {
            let intermediateRate = rates.first(where: { $0.from == from && $0.to != to })
            
            if let intermediateRate {
                let targetCurrency = intermediateRate.to
                let targetRate = rates.first(where: { $0.from == targetCurrency && $0.to == to })
                return intermediateRate.rate * (targetRate?.rate ?? 0)
            }
           //assing zero when it is not possible to convert
           return 0
        }
    }
    
    
   

}
