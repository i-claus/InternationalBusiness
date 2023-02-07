//
//  RatesTask.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation

struct RatesTask : NetworkTask {

    typealias RequestModel = EmptyModel
    
    typealias ResponseModel = [RatesModel]
    
    var request: EmptyModel = EmptyModel()
    
    var endpoint: Endpoint = .rates
    
    var htttpMethod: HTTPMethod = .get
   
}
