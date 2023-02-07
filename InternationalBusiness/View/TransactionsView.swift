//
//  TransactionsView.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 04.02.23.
//

import SwiftUI

struct TransactionsView: View {
    
    @EnvironmentObject var viewModel : ProductsViewModel
    let sku : String
    
    var body: some View {
        ZStack {
            List {
                Section {
                    ForEach(viewModel.skuSpecificTransactions , id: \.self) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                } footer: {
                    HStack {
                        Text("Total \(viewModel.totalAmountOfTransactions.removeTrailingZeros()) EUR")
                            .font(.largeTitle)
                    }
                }
            }
            .navigationTitle(sku)
            .task {
                await viewModel.filterProducts(with: sku)
            }
            if viewModel.fetching {
                ProgressView("Please wait...")
            }
        }
        
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView( sku: "")
            .environmentObject(ProductsViewModel())
    }
}
