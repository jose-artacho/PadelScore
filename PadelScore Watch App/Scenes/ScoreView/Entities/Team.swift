//
//  Team.swift
//  PadelScore Watch App
//
//  Created by Jose Artacho on 10/6/24.
//

import Foundation
import SwiftUI

public struct Team: Identifiable, Equatable {
    public var id = UUID().uuidString
    
    var teamColor: Color
    var isServing: Bool
    var setScore: [Int]
    var gameScore: String
}
