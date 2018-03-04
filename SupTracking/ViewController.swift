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
        /*var user:User = User(Username:"Nunutte", Password:"a", Email:"email@mail.com", PhoneNumber:"06000000", LastName:"lePrenom", FirstName:"LeNom", PostalAddress:"address")
        */
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    @IBAction func buttonConnection(_ sender: Any) {
        let username:String? = self.textId.text
        let password:String? = self.textPassword.text
        
        
        let url = "http://supinfo.steve-colinet.fr/suptracking/"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let postString = "action=login&login=\(username!)&password=\(password!)"
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(response)") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            }
            
            let responseAPI = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseAPI)") // Affiche dans la console la réponse de l'API
            
            let  json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
            if (json!!["success"] as? Bool)!
            {
                let user = json!!["user"] as? [String:Any]
                let firstname:String = (user!["firstname"] as? String)!
                //print(firstname)
                
                self.passedData = User(Username: (user!["username"] as? String)!,
                                       Password: (user!["password"] as? String)!,
                                       Email:(user!["email"] as? String)!,
                                       PhoneNumber:(user!["phone"] as? String)!,
                                       LastName:(user!["lastname"] as? String)!,
                                       FirstName:(user!["firstname"] as? String)!,
                                       PostalAddress:(user!["address"] as? String)!)
                
                print(self.passedData.getUsername())
                let myVC = self.storyboard!.instantiateViewController(withIdentifier: "ConnectVC") as! ConnectVC
                myVC.s = self.passedData.getUsername()
                self.navigationController?.pushViewController(myVC, animated: true)
                
            }
            
            // convert string to NSData
            if error == nil {
                // Ce que vous voulez faire.
            }
        }
        requestAPI.resume()
    
        
    }
    
    
       
        
    
    
}

