//
//  File.swift
//  SupTracking
//
//  Created by Nunutte on 02/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import Foundation

public class User{
    private var username:String
    private var password:String
    private var email:String
    private var phoneNumber:String
    private var lastName:String
    private var firstName:String
    private var postalAddress:String
    
    init (Username: String, Password: String, Email:String, PhoneNumber:String, LastName:String, FirstName:String, PostalAddress:String) {
        self.username = Username
        self.password = Password
        self.email = Email
        self.phoneNumber = PhoneNumber
        self.lastName = LastName
        self.firstName = FirstName
        self.postalAddress = PostalAddress
    }
    
    public func getUsername() -> String {
        return self.username
    }
    
    public func getEmail() -> String {
        return self.email
    }
    
    public func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    public func getLastName() -> String {
        return self.lastName
    }
    
    public func getFirstName() -> String {
        return self.firstName
    }
    
    public func getPostalAddress() -> String {
        return self.postalAddress
    }
}

