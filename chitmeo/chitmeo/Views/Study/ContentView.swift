//
//  ContentView.swift
//  chitmeo
//
//  Created by kyle on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingLoginScreen = false
    @StateObject private var authenManager = AuthenManager()
    var body: some View {
        VStack {
            Text("Hello")
            Text(authenManager.username)
            Button("Show Login Screen") {
                isShowingLoginScreen = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .sheet(isPresented: $isShowingLoginScreen) {
            LoginScreenView()
                .environmentObject(authenManager)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
