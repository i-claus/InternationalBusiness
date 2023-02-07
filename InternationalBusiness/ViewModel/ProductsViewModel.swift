//
//  ProductsViewModel.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import Foundation


class ProductsViewModel : ObservableObject {
    
    var transactions = [TransactionModel]()
    
    @Published var uniqueSKUs = [String]()
    
    @Published var skuSpecificTransactions = [TransactionModel]()
    
    @Published var totalAmountOfTransactions : Double = 0
    
    @Published var fetching = false
   
    
    @MainActor
    func fetchTransactions() async  {
        fetching = true
        do {
            let task = TransactionsTask()
            transactions = try await APIClient().execute(task: task)
            uniqueSKUs = Array(Set(transactions.map({$0.sku}))).sorted()
        } catch {
            print(error)
            
        }
        fetching = false
    }
    
    @MainActor
    func filterProducts(with sku : String)  async {
        fetching = true
        do {
           try await CurrencyHelper.fetchLatestRates()
            skuSpecificTransactions = transactions.filter {$0.sku == sku}
            totalAmountOfTransactions = skuSpecificTransactions.map{$0.euroValue}.reduce(0, +)
        } catch {
            print(error)
        }
        fetching = false
        
    }
    
    
}
