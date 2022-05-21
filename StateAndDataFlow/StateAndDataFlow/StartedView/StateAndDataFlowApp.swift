//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Sergey Runovich on 21.05.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {

    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
