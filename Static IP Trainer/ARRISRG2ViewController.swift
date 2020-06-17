//
//  AARISRG2ViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/21/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit

class ARRISRG2ViewController: UIViewController {
    @IBOutlet weak var RGIPLabel: UILabel!
    @IBOutlet weak var SubnetMaskLabel: UILabel!
    @IBOutlet weak var DHCPStartLabel: UILabel!
    @IBOutlet weak var DHCPEndLabel: UILabel!
    
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
        DHCPStartLabel.text = "\(IPO1).\(IPO2).\(IPO3).\(FUIPO4)"
        DHCPEndLabel.text = "\(IPO1).\(IPO2).\(IPO3).\(LUIPO4)"
        RGIPLabel.text = "\(IPO1).\(IPO2).\(IPO3).\(RGIPO4)"
        SubnetMaskLabel.text = "\(SubnetMask)"
        // Do any additional setup after loading the view.
    }



}
