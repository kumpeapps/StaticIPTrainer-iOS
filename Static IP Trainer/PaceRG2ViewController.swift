//
//  PaceRG2ViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/19/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit

class PaceRG2ViewController: UIViewController {
    @IBOutlet weak var RGIPLabel: UILabel!
    @IBOutlet weak var SubnetMaskLabel: UILabel!
    
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
        RGIPLabel.text = "\(IPO1).\(IPO2).\(IPO3).\(RGIPO4)"
        SubnetMaskLabel.text = "\(SubnetMask)"
        // Do any additional setup after loading the view.
    }



}
