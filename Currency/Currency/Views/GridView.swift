//
//  GridView.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/06.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @Binding var currencies: [[Currency]]
    @Binding var amount: String
    @Binding var selected: Currency?
    var body: some View {
        ScrollView{
            VStack {
                ForEach(currencies, id: \.self) { arr in
                    HStack{
                        ForEach(arr, id: \.id){ currency in
                            VStack {
                                Text(currency.name)
                                    .font(.body)
                                    .padding(5)
                                Text(String(format: "%.2f", currency.calculatedValue(insertedValue: self.amount, selectedCurrencyValue: self.selected?.value)))
                                    .font(.headline)
                                    .padding(5)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2))
                            .padding(10)
                        }
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
