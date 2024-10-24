//
//  ProductModel.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct ProductModel: Decodable {
    let id: Int?
    let title, description, category: String?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand, sku: String?
    let weight: Int?
    let dimensions: Dimensions?
    let warrantyInformation, shippingInformation, availabilityStatus: String?
    let reviews: [Review]?
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: Meta?
    let thumbnail: String?
    let images: [String]?
}

struct Dimensions: Decodable {
    let width, height, depth: Double?
}

struct Meta: Decodable {
    let createdAt, updatedAt, barcode, qrCode: String?
}

struct Review: Decodable {
    let rating: Int?
    let comment, date, reviewerName, reviewerEmail: String?
}
