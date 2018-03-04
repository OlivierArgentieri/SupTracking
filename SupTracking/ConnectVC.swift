//
//  ConnectVC.swift
//  SupTracking
//
//  Created by Nunutte on 04/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//
import Foundation
import UIKit

class ConnectVC: UIViewController {

    @IBOutlet weak var CordLabel: UILabel!
    
    var s:String!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
       
       self.CordLabel.text = s
        
        // Do any additional setup after loading the view.
    }

}
