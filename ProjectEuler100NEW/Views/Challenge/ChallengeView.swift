//
//  ChallengeView.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
        NavigationView {
            List {
                ChallengeList(status: .todo)
                ChallengeList(status: .done)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Challenges")
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
