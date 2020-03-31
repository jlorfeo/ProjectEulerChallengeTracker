//
//  ChallengeDetail.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import SwiftUI

struct ChallengeDetail: View {
    @EnvironmentObject var state: GlobalState
    let challenge: Challenge
    @SwiftUI.State private var showChallengeCompletedAlert = false

    var body: some View {
        VStack {
            WebView(request: URLRequest(url: URL(string: "https://projecteuler.net/problem=\(challenge.id)")!))
                .navigationBarTitle(Text("\(challenge.name)"), displayMode: .inline)
                .navigationBarItems(trailing: NavButton(action: {
                    self.showChallengeCompletedAlert.toggle()
                    self.state.finish(challenge: self.challenge)
                }, isVisible: challenge.status != .done))
                .alert(isPresented: $showChallengeCompletedAlert) {
                    Alert(title: Text("Challenge Completed!"), message: Text("Congratulations! You just finished Challenge \(challenge.id)! Feel free to share your success on Twitter!"), dismissButton: .default(Text("OK")))
                }
        }
    }
}

struct NavButton: View {
    let action: () -> Void

    let isVisible: Bool

    var body: some View {
        ZStack {
            if isVisible {
                Button(action: {
                    self.action()
                }) {
                    Image(systemName: "checkmark.seal.fill")
                }
            }
            else {
                EmptyView()
            }
        }
    }
}

struct ChallengeDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetail(challenge: Challenge(id: 1, name: "Test", status: .done))
    }
}
