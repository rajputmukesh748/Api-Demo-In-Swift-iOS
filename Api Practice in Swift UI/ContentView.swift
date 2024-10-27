//
//  ContentView.swift
//  Api Practice in Swift UI
//
//  Created by apple on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            CustomButton(title: "Get API Call") {
                ApiManager.shared.getApiCall()
            }
            
            CustomButton(title: "Post API Call") {
                ApiManager.shared.postApiCall()
            }
            
            CustomButton(title: "Get Decodable Example") {
                ApiManager.shared.getProductDecodable()
            }
            
            CustomButton(title: "Post Eecodable Example") {
                ApiManager.shared.postApiWithEncodable()
            }
            
            CustomButton(title: "Escapping API Call") {
                ApiManager.shared.escapingGetApiCall()
            }
            
            CustomButton(title: "Async Await Call") {
                Task {
                    do {
                        let product = try await ApiManager.shared.asyncAwaitApiCall()
                        print(product)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
    }
}


struct CustomButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
                .accentColor(.white)
                .font(.title3)
        }
        .padding()
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 10))
        .frame(width: .infinity)
        
    }
}

#Preview {
    ContentView()
}
