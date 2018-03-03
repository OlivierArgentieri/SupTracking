//
//  RegisterVC.swift
//  SupTracking
//
//  Created by Nunutte on 03/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    
    var user:User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    @IBAction func ConfirmUserCreation(_ sender: Any) {
         self.user = User(Username: self.usernameText.text!, Password: self.passwordText.text!, Email:self.emailText.text!, PhoneNumber: self.phoneText.text!, LastName: self.nameText.text!, FirstName: self.firstnameText.text!, PostalAddress: self.postalAddressText.text!)
        performSegue(withIdentifier: "User", sender: user)
        
    }
    */
    /*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController: ViewController =
        
        DestViewController.passedData = self.user
        
    }*/
    
}
