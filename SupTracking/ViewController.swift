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
        
        
        let headers = [
            "contente-type" : "application/type",
            "cache-control" : "no-cache"
        ]
        
        let parameters = [
            "login": "\(username)",
            "password": "\(password)"
        ]
        
        let url = URL(string: "http://supinfo.steve-colinet.fr/suptracking/")!
        //var request = URLRequest(url: url!)
        
        //let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        //request.httpBody = httpBody
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let data = try? JSONSerialization.data(withJSONObject: parameters, options:.prettyPrinted) // pass dictionary to nsdata object and set it as request body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        } catch let error {
            print(error.localizedDescription)
        }
        /*
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        */
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        /*
        session.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print(response)
            }
            
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch{
                    print(error)
                }
            }
        }.resume()*/
        //labelId.text = passedData.getUsername()
    }
    
   
    
    
    
}

