//
//  ConnectVC.swift
//  SupTracking
//
//  Created by Nunutte on 04/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//
import Foundation
import UIKit
import MapKit

class ConnectVC: UIViewController {

    @IBOutlet weak var MKVMap: MKMapView!
    @IBOutlet weak var CordLabel: UILabel!
    
    //var pin:MKAnnotation!
    
    var s:String!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
       let url = "http://supinfo.steve-colinet.fr/suptracking/"
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let postString = "action=getCarPosition&login=admin&password=admin"
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
            print("responseString = \(responseAPI)") // Affiche dans la console la réponse de l'API
            
            let  json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
            if (json!!["success"] as? Bool)!
            {
                let position = json!!["position"] as? [String:Any]
                
                let latitudejson:Double = (position!["latitude"] as? Double)!
                let longitudejson:Double = (position!["longitude"] as? Double)!
                print(latitudejson)
                print(longitudejson)
                let coordinate = CLLocationCoordinate2D(latitude: latitudejson, longitude: longitudejson)
                let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
                self.MKVMap.setRegion(region, animated: true)
                
            }
            
            // convert string to NSData
            if error == nil {
                // Ce que vous voulez faire.
            }
        }
        requestAPI.resume()
       self.CordLabel.text = s
        
        // Do any additional setup after loading the view.
    }

}
