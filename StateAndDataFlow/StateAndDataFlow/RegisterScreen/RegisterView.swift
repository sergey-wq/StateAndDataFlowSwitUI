//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Sergey Runovich on 21.05.2022.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                isValidatedName: userManager.isValidatedName
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.isValidatedName)
        }
        .padding()
    }
}

extension RegisterView {

    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct UserNameTF: View {

    @Binding var name: String
    var isValidatedName: Bool

    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .font(.body)
                    .foregroundColor(isValidatedName ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
