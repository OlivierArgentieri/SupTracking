//
//  RegisterVC.swift
//  SupTracking
//
//  Created by Nunutte on 03/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var newUserLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postalAddressLabel: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var firstnameText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var postalAddressText: UITextField!
    
    var user:User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ConfirmUserCreation(_ sender: Any) {
         self.user = User(Username: self.usernameText.text!, Password: self.passwordText.text!, Email:self.emailText.text!, PhoneNumber: self.phoneText.text!, LastName: self.nameText.text!, FirstName: self.firstnameText.text!, PostalAddress: self.postalAddressText.text!)
        performSegue(withIdentifier: "User", sender: user)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController: ViewController = segue.destination as! ViewController
        
        DestViewController.passedData = self.user
        
    }
    
}
