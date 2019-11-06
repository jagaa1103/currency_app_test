//
//  CellView.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/04.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct CellView: View {
    let currency: Currency
    var body: some View {
        VStack {
            Text(currency.name)
                .font(.body)
            Text(String(format: "%.2f", currency.value))
                .font(.headline)
//            Text(currency.description).font(.footnote)
        }
        .background(Color.white)
        .frame(minWidth: 0, maxWidth: .infinity)
        .border(Color.gray, width: 1)
        .padding(10)
        .cornerRadius(10)
//        .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
    }
}
