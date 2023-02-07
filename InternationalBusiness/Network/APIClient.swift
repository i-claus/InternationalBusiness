//
//  APIClient.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation


enum CustomError : Error {
    case invalidURL
    case apiError(String)
}

struct APIClient {
    
    func execute<T : NetworkTask>(task : T) async throws  ->  T.ResponseModel {
        guard  let urlRequest = task.urlRequest else { throw CustomError.invalidURL}
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let responseModel = try JSONDecoder().decode(T.ResponseModel.self, from: data)
        
        return responseModel
    }
    
    
}
