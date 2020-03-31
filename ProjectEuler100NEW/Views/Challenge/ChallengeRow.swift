//
//  ChallengeRow.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import SwiftUI

struct ChallengeRow: View {
    let challenge: Challenge
    
    var body: some View {
        NavigationLink(destination: ChallengeDetail(challenge: challenge)) {
            Text("Challenge #\(challenge.id): \(challenge.name)")
        }
    }
}

struct ChallengeRow_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRow(challenge: Challenge(id: 1, name: "Test", status: .done))
    }
}
