//
//  GlobalState.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import Foundation

enum Constants {
    static let userDefaults = UserDefaults.standard
    static let challengesKey = "CHALLENGES"
}

class GlobalState: ObservableObject {
    @Published var challenges: [Challenge] {
        didSet {
            let encoded = try? JSONEncoder().encode(challenges)
            Constants.userDefaults.set(encoded, forKey: Constants.challengesKey)
        }
    }

    init() {
        if let challenges = Constants.userDefaults.array(forKey: Constants.challengesKey) as? [Challenge] {
            self.challenges = challenges
        } else {
            let challenges = Bundle.main.decode([Challenge].self, from: "initialChallenges.json")
            self.challenges = challenges
        }
    }

    func reset() {
        let challenges = Bundle.main.decode([Challenge].self, from: "initialChallenges.json")
        self.challenges = challenges
    }

    func finish(challenge: Challenge) {
        let completedChallenge = Challenge(id: challenge.id, name: challenge.name, status: .done)
        challenges[challenge.id - 1] = completedChallenge
    }
}
