//
//  Environment.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation

enum NetworkEnvironment : String {
    case prod
    case test
    
    var urlHostString : String {
        switch self {
        case .prod:
            return  "android-ios-service.herokuapp.com"
        case .test:
            return  "android-ios-service.herokuapp.com"

        }
    }
    
    
    static var currentEnvironment : Self {
        .prod
    }
}


