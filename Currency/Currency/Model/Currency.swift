//
//  Currency.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/01.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import SwiftUI

struct Currency: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var value: Double
    let description: String
    
    func calculatedValue(insertedValue: String, selectedCurrencyValue: Double?)-> Double {
        if let num = Double(insertedValue), let divider = selectedCurrencyValue {
            return num * (value / divider)
        }else{
            return value
        }
    }    
}

