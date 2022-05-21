//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Sergey Runovich on 21.05.2022.
//

import Foundation

final class UserManager: ObservableObject {

    @Published var user = User()

    var isValidatedName: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}
