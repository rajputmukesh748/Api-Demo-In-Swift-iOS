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
            Button(action: {
                ApiManager.shared.getApiCall()
            }){
                Text("Get API Call")
                    .accentColor(.white)
                    .font(.title3)
            }
            .padding()
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            
            
            Button(action: {
                ApiManager.shared.postApiCall()
            }){
                Text("Post API Call")
                    .accentColor(.white)
                    .font(.title3)
            }
            .padding()
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            
            Button(action: {
                ApiManager.shared.getProductDecodable()
            }){
                Text("Get Decodable Example")
                    .accentColor(.white)
                    .font(.title3)
            }
            .padding()
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            
            
            Button(action: {
                ApiManager.shared.postApiWithEncodable()
            }){
                Text("Post Eecodable Example")
                    .accentColor(.white)
                    .font(.title3)
            }
            .padding()
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
