//
//  StartView.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 5/6/24.
//

import SwiftUI

struct StartView: View {
    
    @State private var showConfigView = false
    
    var body: some View {
        VStack {
            
            Image("logo", bundle: .main)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            Button(action: {
                showConfigView = true
            }) {
                Text("Comenzar").foregroundColor(.primaryBlue)
            }.background(.white)
                .cornerRadius(50)
            
            Spacer().frame(height: 24)
            
        }
        .padding(.horizontal, 24)
            .navigationDestination(isPresented: $showConfigView) {
                
                ConfigView()
            }
            
    }
}

#Preview {
    StartView()
}
