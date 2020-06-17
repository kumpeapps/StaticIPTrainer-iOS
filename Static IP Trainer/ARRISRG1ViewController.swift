//
//  AARISRG1ViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/21/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit

class ARRISRG1ViewController: UIViewController {

    //Declare Variables
    var IPO1 = ""
    var IPO2 = ""
    var IPO3 = ""
    var FUIPO4 = ""
    var LUIPO4 = ""
    var RGIPO4 = ""
    var SubnetMask = ""
    var PrimaryDNS = ""
    var SecondaryDNS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextButtonPressed(_ sender: Any) {
    performSegue(withIdentifier: "ARRISRG2", sender: nil)
    }
    
    //Set Variables to send to Select RG during segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ARRISRG2" {
            let SegueViewController = segue.destination as! ARRISRG2ViewController
            SegueViewController.IPO1 = self.IPO1
            SegueViewController.IPO2 = self.IPO2
            SegueViewController.IPO3 = self.IPO3
            SegueViewController.FUIPO4 = self.FUIPO4
            SegueViewController.LUIPO4 = self.LUIPO4
            SegueViewController.RGIPO4 = self.RGIPO4
            SegueViewController.SubnetMask = self.SubnetMask
            SegueViewController.PrimaryDNS = self.PrimaryDNS
            SegueViewController.SecondaryDNS = self.SecondaryDNS
            
        }
    }


}
