//
//  InternationalBusinessUITests.swift
//  InternationalBusinessUITests
//
//  Created by Claudio Vega on 04.02.23.
//

import XCTest

class ProductsViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        app = XCUIApplication()
        app.launch()
    }

    func testTappingListCellNavigatesToTransactionsView() {
        let table = app.tables.element(boundBy: 0)

        // Wait for the table to appear
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: table, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        // Tap the first cell in the table
        let cell = table.cells.element(boundBy: 0)
        cell.tap()

        // Wait for the TransactionsView to appear
        let transactionsView = app.navigationBars["Transactions"]
        expectation(for: exists, evaluatedWith: transactionsView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        // Assert that the TransactionsView is being displayed
        XCTAssertTrue(transactionsView.exists)
    }
}

