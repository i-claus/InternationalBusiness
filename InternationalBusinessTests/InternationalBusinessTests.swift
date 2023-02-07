//
//  InternationalBusinessTests.swift
//  InternationalBusinessTests
//
//  Created by Claudio Vega on 04.02.23.
//


import XCTest

final class APIClientTests: XCTestCase {
    
    func testExecute() async throws {
        let task = RatesTask()
        let rates = try await APIClient().execute(task: task)
        
        XCTAssertTrue(rates.count > 0)
    }
    
    
    func testFetchTransactions() async throws  {
        let viewModel = ProductsViewModel()
        await viewModel.fetchTransactions()
        
        XCTAssertTrue(viewModel.transactions.count > 0)
        XCTAssertTrue(viewModel.uniqueSKUs.count > 0)
    }
 
    
}




final class CurrencyHelperTests: XCTestCase {
    
    override func setUp() {
        // populate the rates array with test data
        CurrencyHelper.rates = [
            RatesModel(from: "USD", to: "EUR", rate: 0.8),
            RatesModel(from: "EUR", to: "USD", rate: 1.25),
            RatesModel(from: "EUR", to: "GBP", rate: 0.7),
            RatesModel(from: "GBP", to: "EUR", rate: 1.43)
        ]
    }
    
    func testGetConversionRate() {
        let directRateExpectation = XCTestExpectation(description: "Test getting direct conversion rate")
        
        // test getting direct conversion rate
        let directRate = CurrencyHelper.getConversionRate(from: "USD", to: "EUR")
        XCTAssertEqual(directRate, 0.8, "Direct conversion rate should be 0.8")
        
        directRateExpectation.fulfill()
        
        let indirectRateExpectation = XCTestExpectation(description: "Test getting indirect conversion rate")
        
        // test getting indirect conversion rate
        let indirectRate = CurrencyHelper.getConversionRate(from: "USD", to: "GBP").bankersRounding(toPlaces: 2)
        XCTAssertEqual(indirectRate, 0.56, "Indirect conversion rate should be 0.56")
        
        indirectRateExpectation.fulfill()
        
        wait(for: [directRateExpectation, indirectRateExpectation], timeout: 5.0)
    }
    
    
    func testFetchLatestRates() async throws {
        try await CurrencyHelper.fetchLatestRates()
        
        XCTAssertTrue(CurrencyHelper.rates.count > 0)
    }
}



