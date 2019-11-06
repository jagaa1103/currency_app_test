//
//  Response.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/05.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

struct Response: Codable {
    var success:Bool
    var terms: String
    var privacy: String
    var timestamp: Int64
    var source: String
    var quotes: [String: Double]
}

