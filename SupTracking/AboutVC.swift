//  AboutVC.swift
//  SupTracking
//
//  Created by Nunutte on 04/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var textViewAbout: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewAbout.textAlignment = NSTextAlignment.center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
