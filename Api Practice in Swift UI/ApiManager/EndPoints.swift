//
//  EndPoints.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import Foundation

class EndPoints {
    
    private static let baseUrl = String("https://dummyjson.com/")
    
    static var getApiUrl: String {
        return self.baseUrl + "products/1"
    }
    
    static var postApiUrl: String {
        return self.baseUrl + "products/add"
    }
}
