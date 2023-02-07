//
//  TransactionRowView.swift
//  InternationalBusiness
//
//  Created by Claudio Vega on 04.02.23.
//

import SwiftUI

struct TransactionRowView: View {
    let transaction : TransactionModel
    var body: some View {
        HStack {
            Text("\(transaction.amount.bankersRounding(toPlaces: 2).removeTrailingZeros())")
            Text(transaction.currency)
            Spacer()
            Image(systemName: "arrow.left.arrow.right")
            Spacer()
            Text(transaction.euroValueString)
          
        }
    }
}

