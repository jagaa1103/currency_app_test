//
//  ContentViewModel.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/04.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var currencies: [Currency] = []
    @Published var gridCurrencies: [[Currency]] = [[]]
    @Published var selectedCurrency: Currency?
    @Published var amount = "1"
    
    let cacheManager = CacheManager()
    
    func fetch() {
        currencies.removeAll()
        self.cacheManager.download(completion: { result in
            switch(result){
                case .success(let data):
                    DispatchQueue.main.async {
                        self.currencies = self.parseData(data: data).sorted{ $0.name < $1.name }
                        self.gridCurrencies = self.currencies.grid(into: 3)
                    }
                    break
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    break
            }
        })
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


extension Array {
    func grid(into size:Int) -> [[Element]] {
        
        var chunkedArray = [[Element]]()
        
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - 1..<index]))
            }
        }
        
        return chunkedArray
    }
}
