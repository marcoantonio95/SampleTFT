//
//  DevelopmentToolsHomeView.swift
//  SampleTFT
//
//  Created by Marco Antonio on 17/01/25.
//

import SwiftUI

struct DevelopmentToolsHomeView:
    View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                Text("Go to Request Mocker")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                Spacer()
            }
            .navigationTitle("Dev tools")
            .navigationBarItems(leading:
                 Image(systemName: "xmark")
                .font(.body)
                .scaledToFit()
                .foregroundColor(.black)
                .onTapGesture {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    DevelopmentToolsHomeView()
}
