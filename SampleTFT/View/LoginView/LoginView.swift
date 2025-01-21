//
//  ContentView.swift
//  SampleTFT
//
//  Created by Marco Antonio on 09/01/25.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    Text("Tela Inicial")
                        .font(.largeTitle)
                        .padding()

                    NavigationLink(destination: TierListView()) {
                        Text("Ir para Tela 1")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    NavigationLink(destination: UserProfileView()) {
                        Text("Ir para Tela 2")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .navigationTitle("Navegação")
            }
        }
}

#Preview {
    LoginView()
}
