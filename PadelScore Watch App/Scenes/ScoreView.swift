//
//  ScoreView.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 6/6/24.
//

import SwiftUI

struct ScoreView: View {
    
    @State private var isGoldBall: Bool
    
    init(isGoldBall: Bool) {
        self.isGoldBall = isGoldBall
    }
    
    var body: some View {
        VStack {
            
            Image("logo", bundle: .main)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            
            
            Spacer().frame(height: 24)
            
        }
        .padding(.horizontal, 24)
            
    }
}

func getScores(isGoldBall: Bool) {}

#Preview {
    ScoreView(isGoldBall: true)
}
