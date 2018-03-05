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
    @IBOutlet weak var onClickLogout: UIButton!
    
    //var pin:MKAnnotation!
    
    var s:String!
    var stopRefreshPosition:Bool!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        self.stopRefreshPosition = false
        print(globalUser.sharedInstance.isConnected())
        if(globalUser.sharedInstance.isConnected()){
            
            self.CordLabel.text =  globalUser.sharedInstance.getGlobalUser().getUsername()
            DispatchQueue.global(qos: .background).async {
                while(!self.stopRefreshPosition)
                {
                    
                    sleep(1)
                    print("Salut")
                    useAPI.getCarPosition(login: globalUser.sharedInstance.getGlobalUser().getUsername(), password: globalUser.sharedInstance.getGlobalUser().getPassword()) { (completed, result) in
                        if (completed){
                            if (result["success"] as? Bool)!{
                                
                                let position = result["position"] as? [String:Any]
                                let latitudejson:Double = (position!["latitude"] as? Double)!
                                let longitudejson:Double = (position!["longitude"] as? Double)!
                                
                                let coordinate = CLLocationCoordinate2D(latitude: latitudejson, longitude: longitudejson)
                                let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
                                self.MKVMap.setRegion(region, animated: true)
                                
                                let annotation = MKPointAnnotation()
                                
                                annotation.coordinate = coordinate
                                annotation.title = "Your car is here"
                                self.MKVMap.addAnnotation(annotation)
                            }
                        } else {
                            // TODO
                        }
                    }
                }
            }
        }
    }

    @IBAction func OnClickLogout(_ sender: Any) {
        self.stopRefreshPosition = true
        //globalUser.sharedInstance.killGlobalUser()
    }
}
