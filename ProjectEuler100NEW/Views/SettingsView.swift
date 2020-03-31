//
//  SettingsView.swift
//  ProjectEuler100NEW
//
//  Created by Jan-Erik LORFEO on 22.03.20.
//  Copyright © 2020 jel. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var state: GlobalState
    @State private var showResetWarningDialog = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button(action: {
                        self.showResetWarningDialog = true
                    }) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                            Text("Reset challenges")
                        }
                    }
                    .alert(isPresented: $showResetWarningDialog) {
                        Alert(title: Text("Reset all challenges"), message: Text("Are you sure that you want to reset your progress?"), primaryButton: .default(Text("Yes"), action: { self.state.reset() }), secondaryButton: .cancel(Text("Cancel")))
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
