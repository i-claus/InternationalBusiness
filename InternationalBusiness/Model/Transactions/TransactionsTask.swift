//
//  TransactionsTask.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation


struct TransactionsTask : NetworkTask {
   
    
    typealias RequestModel = EmptyModel
    
    typealias ResponseModel = [TransactionModel]
    
    var endpoint: Endpoint = .transactions
    
    var htttpMethod: HTTPMethod = .get
    
    var request: EmptyModel = EmptyModel()
    
}
