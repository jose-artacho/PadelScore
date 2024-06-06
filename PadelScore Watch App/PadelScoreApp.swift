//
//  PadelScoreApp.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 5/6/24.
//

import SwiftUI

@main
struct PadelScore_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Image("background", bundle: .main)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFill()
                
                NavigationStack {
                    StartView()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}
