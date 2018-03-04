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
    var urlAPI:String = "http://supinfo.steve-colinet.fr/suptracking/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textId.text = "admin"
        self.textPassword.text = "admin"
        
        /*var user:User = User(Username:"Nunutte", Password:"a", Email:"email@mail.com", PhoneNumber:"06000000", LastName:"lePrenom", FirstName:"LeNom", PostalAddress:"address")
        */
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    @IBAction func buttonConnection(_ sender: Any) {
        // Use of userLogin
        useAPI.userLogin(login: "admin", password:"admin") { (completed, result) in
            if (completed) {
                print("Return of userLogin")
                print(result)
                print("")
            }
            else {
                print("Failure: Request To API Failed")
            }
        }
        
        // Use of getCarPosition
        useAPI.getCarPosition(login: "admin", password:"admin") { (completed, result) in
            if (completed) {
                print("Return of getCarPosition")
                print(result)
                print("")
            }
            else {
                print("Failure: Request To API Failed")
            }
        }
        
        // Use of updatePosition
        useAPI.updatePosition(login: "admin", password:"admin", latitude: "789456123", longitude: "321654987") { (completed, result) in
            if (completed) {
                print("Return of updatePosition")
                print(result)
                print("")
            }
            else {
                print("Failure: Request To API Failed")
            }
        }
    }
}

