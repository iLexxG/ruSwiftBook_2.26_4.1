//
//  User.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 11.03.2022.
//

import Foundation

struct UserProfile {
    let userLogin = "User"
    let userPassword = "Password"
    let userPersonalData: Person
    
    static func getUserProfile() -> UserProfile {
        UserProfile(
            userPersonalData: Person()
        )
    }
}
