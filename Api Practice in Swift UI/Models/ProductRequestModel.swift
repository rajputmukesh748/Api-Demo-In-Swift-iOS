//
//  ProductRequestModel.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import Foundation

struct ProductRequestModel: Encodable {
    let title, category: String?
    let price: Double?
}
