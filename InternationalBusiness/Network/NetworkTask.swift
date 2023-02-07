//
//  Network.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation

protocol NetworkTask : Codable {
    associatedtype RequestModel : Codable
    associatedtype ResponseModel : Codable
    
    var request  : RequestModel {get}
    var endpoint : Endpoint { get set }
    var htttpMethod : HTTPMethod {get set}
    var requiresToken : Bool {get}
    var urlRequest : URLRequest? {get}
}

extension NetworkTask {
    
    var urlRequest : URLRequest?  {
        get {
            var components = URLComponents()
            components.scheme = "https"
            components.host = NetworkEnvironment.currentEnvironment.urlHostString
            components.path = "/\(endpoint.rawValue)"
            guard  let url = components.url else { return nil}
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            if requiresToken {
                urlRequest.setValue("Token", forHTTPHeaderField: "some token")
            }
            urlRequest.httpMethod = self.htttpMethod.rawValue
            return urlRequest
        }
       
    }
    
    var requiresToken : Bool {
        false
    }
}
