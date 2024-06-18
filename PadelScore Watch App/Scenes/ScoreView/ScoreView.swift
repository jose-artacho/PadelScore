//
//  ScoreView.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 6/6/24.
//

import SwiftUI

struct ScoreView: View {
    
    @State var blueTeam = Team(teamColor: .blue, isServing: true, setScore: [0], gameScore: "0")
    @State var redTeam = Team(teamColor: .red, isServing: false, setScore: [0], gameScore: "0")
    
    var isGoldBall: Bool = false
    var points = ["0", "15", "30", "40"]
    
    init(isGoldBall: Bool) {
        self.isGoldBall = isGoldBall
        
        if !isGoldBall {
            points.append("Ad")
        }
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            
            Image("logo", bundle: .main)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 24)
            
            Spacer().frame(height: 16)
            
            Score(team: $blueTeam)
            
            Score(team: $redTeam)
            
            Spacer().frame(height: 16)
            
        }
    }
    
    @ViewBuilder
    func Score(team: Binding<Team>) -> some View {
        GeometryReader { proxy in
            HStack(spacing: .zero) {
                
                Spacer().frame(width: proxy.size.width * 0.05)
                
                Rectangle()
                    .fill(team.teamColor.wrappedValue)
                    .border(.white, width: 1)
                    .overlay {
                        Text("🎾")
                            .opacity(team.isServing.wrappedValue ? 1 : 0)
                    }
                    .frame(width: proxy.size.width * 0.15)
                
                
                ForEach(team.setScore.wrappedValue, id: \.self) { score in
                    
                    Rectangle()
                        .fill(.black)
                        .border(.white, width: 1)
                        .overlay {
                            Text(score.description)
                        }
                        .frame(width: proxy.size.width * 0.15)
                }
                
                Spacer()
                
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(team.teamColor.wrappedValue)
                    .overlay {
                        Text(team.gameScore.wrappedValue)
                            .foregroundColor(.white)
                    }
                    .frame(width: proxy.size.width * 0.3, alignment: .leading)
                    .onTapGesture {
                        updateScore(team: team)
                    }
            }
        }
    }
    
    func updateScore(team: Binding<Team>) {
        points.firstIndex(where: { currentPoint in
            team.gameScore.wrappedValue == currentPoint
        }).flatMap { index in
            if (index + 1 == points.count) {
                team.gameScore.wrappedValue = points.first ?? "0"
            } else {
                team.gameScore.wrappedValue = points[index + 1]
            }
        }
    }
}

#Preview {
    ScoreView(isGoldBall: true)
}
