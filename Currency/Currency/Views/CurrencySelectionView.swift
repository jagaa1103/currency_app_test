//
//  CurrencySelectionView.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/05.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencySelectionView: View {
    @Binding var showSelectionView: Bool
    @State var currencies: [Currency]
    @Binding var selectedCurrency: Currency?
    var body: some View {
        NavigationView{
            List(currencies){ currency in
                ListItem(currency: currency, selectedCurrency: self.$selectedCurrency)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        self.selectedCurrency = currency
                        self.showSelectionView = false
                    }
            }
        .navigationBarTitle("Select Currency")
        }
    }
}

struct ListItem: View {
    @State var currency: Currency
    @Binding var selectedCurrency: Currency?
    var isSelected: Bool {
        if let selected = selectedCurrency {
            return selected.id == currency.id
        }
        return false
    }
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(currency.name)
                Text(currency.description)
                    .font(.footnote)
            }
            Spacer()
            if self.isSelected {
                Image(systemName: "checkmark")
                .foregroundColor(.blue)
            }
        }
    }
}
