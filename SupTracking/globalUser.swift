//
//  globalUser.swift
//  SupTracking
//
//  Created by Nunutte on 05/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import Foundation

final class globalUser {
    
    // globalUser(singleton) vars
    var user:User? = nil
    var userIsLogin:Bool = false
    
    // SharedInstance of sigleton
    static let sharedInstance : globalUser = {
        let instance = globalUser()
        return instance
    }()
    
    // Can't init is singleton
    private init() { /* --Need_to_be_empty-- */ }
    
    // Used to set a new globalUser
    func setGlobalUser(newUser: User) {
        self.user = User(Username: newUser.getUsername(),
                         Password: newUser.getPassword(),
                         Email: newUser.getEmail(),
                         PhoneNumber: newUser.getPhoneNumber(),
                         LastName: newUser.getLastName(),
                         FirstName: newUser.getFirstName(),
                         PostalAddress: newUser.getPostalAddress())
        self.userIsLogin = true
    }
    
    // Used to get the globalUser
    func getGlobalUser() -> User {
        return self.user!
    }
    
    // Used to test if globalUser exist and if is connected
    func isConnected() -> Bool {
        var userExist:Bool = false
        if(self.user != nil && self.userIsLogin) {
            userExist = true
        }
        return userExist
    }
    
    // Used to unset the globalUser
    func killGlobalUser() -> Bool {
        self.userIsLogin = false
        self.user = nil
        
        return !userIsLogin
    }
}
