//
//  ContentView.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/01.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @State var showSelectionView = false
    
    var body: some View {
        VStack{
            HStack{
                TextField("Insert", text: $viewModel.amount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                   .padding()
                Button(action: { self.showSelectionView = true }, label: {
                    Text(viewModel.selectedCurrency?.name ?? "Select")
                        .font(.title)
                })
                .padding()
            }
            List(viewModel.currencies){ currency in
                VStack(alignment: .leading){
                    Text(currency.name)
                    Text(String(format: "%.2f", currency.calculatedValue(insertedValue: self.viewModel.amount, selectedCurrencyValue: self.viewModel.selectedCurrency?.value)))
                }
            }
        }
        .sheet(isPresented: $showSelectionView, content: {
            CurrencySelectionView(showSelectionView: self.$showSelectionView, currencies: self.viewModel.currencies, selectedCurrency: self.$viewModel.selectedCurrency)
        })
        .onAppear(){
            print("onAppear")
            self.viewModel.fetch()
        }
    }
}
