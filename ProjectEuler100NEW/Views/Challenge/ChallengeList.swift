//
//  ChallengeList.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import SwiftUI

struct ChallengeList: View {
    @EnvironmentObject var state: GlobalState
    let status: ChallengeStatus
    
    var body: some View {
        if status == .todo {
            return Section(header: Text("TODO").font(.headline)) {
                ForEach(state.challenges.filter { challenge in
                    challenge.status == status
                }.prefix(10)) { challenge in
                    ChallengeRow(challenge: challenge)
                }
            }
        }
        else {
            return Section(header: Text("DONE").font(.headline)) {
                ForEach(state.challenges.filter { challenge in
                    challenge.status == status
                }.sorted(by: { challengeLeft, challengeRight in
                    challengeLeft.id > challengeRight.id
                    }).prefix(10)) { challenge in
                    ChallengeRow(challenge: challenge)
                }
            }
        }
        
        
    }
}

struct ChallengeList_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeList(status: .done)
    }
}
