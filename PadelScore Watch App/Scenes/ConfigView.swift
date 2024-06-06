//
//  ConfigView.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 6/6/24.
//

import SwiftUI

struct ConfigView: View {
    
    @State private var isGoldBall = false
    @State private var showScoreView = false
    
    var body: some View {
        VStack {
            
            Text("¿Bola de oro o ventaja?")
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 24) {
                Circle()
                    .fill(.gold.gradient)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        isGoldBall = true
                        showScoreView = true
                    }
                
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .overlay {
                        Text("ADV")
                            .foregroundColor(.primaryBlue)
                    }
                    .onTapGesture {
                        isGoldBall = false
                        showScoreView = true
                    }
            }

            Spacer()
            
        }
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $showScoreView) {
            
            ScoreView(isGoldBall: isGoldBall)
        }
    }
}

#Preview {
    ConfigView()
}
