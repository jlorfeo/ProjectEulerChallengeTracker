//
//  Challenge.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import Foundation

struct Challenge: Codable, Identifiable {
    let id: Int
    let name: String
    let status: ChallengeStatus
}

enum ChallengeStatus: Int, Codable {
    case todo = 0
    case done = 1
}
