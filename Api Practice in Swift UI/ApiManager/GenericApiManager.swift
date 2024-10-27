//
//  GenericApiManager.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import Foundation

enum ApiErrors: Error {
    case inValidUrl
    case invalidResponse
}

struct GenericApiManager {
    
    public static let shared = GenericApiManager()
    
    public func getApiCall<T: Decodable>(url: URL, returnType: T.Type, onCompletion: @escaping (_ success: T?, _ failure: Error?) -> Void){
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                onCompletion(nil, error)
                return
            }
            
            if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data)
                    onCompletion(decodeData, nil)
                } catch let exception {
                    onCompletion(nil, exception)
                }
            }
        }.resume()
    }
    
    
    public func getAsyncApiCall<T: Decodable>(url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw ApiErrors.inValidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiErrors.invalidResponse
        }
        
        let decodeData = try JSONDecoder().decode(T.self, from: data)
        return decodeData
    }
    
}
