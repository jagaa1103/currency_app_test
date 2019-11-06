//
//  ContentViewModel.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/04.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI
import Combine

let urlString = "http://www.apilayer.net/api/live?access_key=71173edc3f850058ab4ddbfcd143d250&format=1"

class ContentViewModel: ObservableObject {
    @Published var currencies: [Currency] = []
    @Published var selectedCurrency: Currency?
    @Published var amount = "1"
    
    func fetch() {
        currencies.removeAll()
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            }else {
                if let d = data {
                    DispatchQueue.main.async {
                        self.currencies = self.parseData(data: d).sorted{ $0.name < $1.name }
                        print(self.currencies.count)
                    }
                }
            }
        }.resume()
    }
    func parseData(data: Data) -> [Currency] {
        let locale = Locale.current
        var currencies = [Currency]()
        do {
            let json = try JSONDecoder().decode(Response.self, from: data)
            currencies = json.quotes.enumerated().map { (index, data) in
                var name = data.key
                if name == "USDUSD" {
                    name = "USD"
                }else{
                    name = name.replacingOccurrences(of: "USD", with: "")
                }
                let countryName = locale.localizedString(forCurrencyCode: name)
                let currency = Currency(name: name, value: data.value, description: countryName ?? "")
                if currency.name == "USD" {
                    self.selectedCurrency = currency
                }
                return currency
            }
        } catch {
            print(error.localizedDescription)
        }
        return currencies
    }
}
