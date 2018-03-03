//
//  ViewController.swift
//  SupTracking
//
//  Created by Nunutte on 01/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var user:User = User(Username:"Nunutte", Password:"a", Email:"email@mail.com", PhoneNumber:"06000000", LastName:"lePrenom", FirstName:"LeNom", PostalAddress:"address")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var textId: UITextField!
    @IBOutlet weak var buttonConnection: UIButton!
    @IBOutlet weak var buttonNewAccount: UIButton!
    @IBOutlet weak var textPassword: UITextField!
    
  
    @IBAction func buttonConnection(_ sender: Any) {
        labelId.text = "taGrossMere"
    }
    
    @IBAction func touchDownNewAccount(_ sender: UIButton) {
        
    }
    
    
    
}

