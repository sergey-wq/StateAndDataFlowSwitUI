//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Sergey Runovich on 21.05.2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var userManager: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)

            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)

            Spacer()
            
            VStack {
                Spacer()

                ButtonView(title: timer.buttonTitle, color: .red, action: { timer.startTimer() })

                Spacer()

                ButtonView(title: "LogOut", color: .blue, action: {
                    DataManager.shared.deletedUser(userManager: userManager)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
