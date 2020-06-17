//
//  MainViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/18/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var IPO1: UITextField!
    @IBOutlet weak var IPO2: UITextField!
    @IBOutlet weak var IPO3: UITextField!
    @IBOutlet weak var IPO4: UITextField!
    var IPO1txt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("\n\n\nStart IP: \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.IPO4.text!)\nBlock Size: \n\n\n")
    }
    

}

