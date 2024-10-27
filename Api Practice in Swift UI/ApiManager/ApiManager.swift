//
//  ApiManager.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    private init() {}
    
    
    func getApiCall() {
        if let url = URL(string: EndPoints.getApiUrl){
            URLSession.shared.dataTask(with: url) { data, response, errorResponse in
                if let errorResponse = errorResponse {
                    debugPrint(errorResponse)
                    return
                }
                
                if let data = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data)
                        debugPrint(jsonObject)
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    
    func postApiCall(){
        if let url = URL(string: EndPoints.postApiUrl){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body : [String: Any] = [
                "title": "New Product",
                "category": "beauty",
                "price": 1000.0
            ]
            
            guard let data = try? JSONSerialization.data(withJSONObject: body) else {
                print("Failed to serialize body")
                return
            }
            
            urlRequest.httpBody = data
            URLSession.shared.dataTask(with: urlRequest){ data, response, errorResponse in
                if let errorResponse = errorResponse {
                    print(errorResponse)
                }
                
                if let data = data {
                    do {
                        let printData = try JSONSerialization.jsonObject(with: data)
                        print(printData)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                
            }.resume()
        }
        
    }
    
    
    func getProductDecodable(){
        if let url = URL(string: EndPoints.getApiUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let errorMessage = error {
                    debugPrint(errorMessage)
                    return
                }
                
                if let responseData = data {
                    do {
                        let decodeResponse = try JSONDecoder().decode(ProductModel.self, from: responseData)
                        debugPrint(decodeResponse)
                    } catch let exception {
                        debugPrint(exception.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    
    func postApiWithEncodable(){
        if let url = URL(string: EndPoints.postApiUrl){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
            let productRequestModel = ProductRequestModel(title: "New Product Added", category: "beauty", price: 250)
            guard let encodableData = try? JSONEncoder().encode(productRequestModel) else {
                debugPrint("Unable to encode model data.............")
                return
            }
            debugPrint("Encode Body ====== \(encodableData)")
            urlRequest.httpBody = encodableData
            
            URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                
                if let data = data {
                    do {
                        let decodeResponse = try JSONDecoder().decode(ProductModel.self, from: data)
                        debugPrint(decodeResponse)
                    } catch let exception {
                        debugPrint(exception.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    
    func escapingGetApiCall(){
        if let url = URL(string: EndPoints.getApiUrl) {
            GenericApiManager.shared.getApiCall(url: url, returnType: ProductModel.self) { data, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                
                if let data = data {
                    debugPrint(data.title ?? "N/A")
                }
            }
        }
    }
    
    
    func asyncAwaitApiCall() async throws -> ProductModel {
        let response: ProductModel = try await GenericApiManager.shared.getAsyncApiCall(url: EndPoints.getApiUrl)
        return response
    }
}
