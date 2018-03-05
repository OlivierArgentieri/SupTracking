//
//  ViewController.swift
//  SupTracking
//
//  Created by Nunutte on 01/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var textId: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var btnConnexion: UIButton!
    
    var passedData: User! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textId.text = "admin"
        self.textPassword.text = "admin"
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func buttonConnection(_ sender: Any) {
       
        let username:String? = self.textId.text
        let password:String? = self.textPassword.text
        
        useAPI.userLogin(login:username!, password:password!) { (completed, result) in
            if (completed){
                if (result["success"] as? Bool)!{
                    let user = result["user"] as? [String:Any]
                    self.passedData = User(Username: (user!["username"] as? String)!,
                                           Password: (user!["password"] as? String)!,
                                           Email:(user!["email"] as? String)!,
                                           PhoneNumber:(user!["phone"] as? String)!,
                                           LastName:(user!["lastname"] as? String)!,
                                           FirstName:(user!["firstname"] as? String)!,
                                           PostalAddress:(user!["address"] as? String)!)
                    print(self.passedData.getUsername())
                    globalUser.sharedInstance.setGlobalUser(newUser: self.passedData)
                }
            } else {
                // TODO
            }
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    
}


