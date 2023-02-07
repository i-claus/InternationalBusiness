//
//  ProductsView.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 03.02.23.
//

import SwiftUI

struct ProductsView: View {
    
    @State private var path : [String] = []
    
    @ObservedObject var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                List(viewModel.uniqueSKUs, id: \.self) { sku in
                    NavigationLink(value: sku) {
                        Text(sku)
                    }
                }
                .navigationDestination(for: String.self) { sku in
                    TransactionsView(sku: sku)
                        .environmentObject(viewModel)
                }
                .navigationTitle("Products")
                .task {
                    await viewModel.fetchTransactions()
                }
                if viewModel.fetching {
                    ProgressView("Please wait...")
                }
            }
        }
        
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
