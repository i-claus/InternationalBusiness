//
//  RatesModel.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation

struct RatesModel : Codable, Hashable {
    let from, to : String
    let rate : Double
}
