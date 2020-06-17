//
//  SelectRGViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/19/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit

class SelectRGViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var SelectRGPicker: UIPickerView!
    
    var SelectRG = ["Select RG", "3801", "5031", "NVG589", "NVG599", "5268AC", "BGW210"]

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
    var SelectedRG = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Run SelectRG Picker
        SelectRGPicker.delegate = self
        SelectRGPicker.dataSource = self
    }
    
    //MARK: Configure Select RG Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.SelectRG.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.SelectRG[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.SelectedRG = self.SelectRG[row]
    }
    
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        
        //If RG Model is of 2Wire/Pace manufacture then goto Pace Instructions
        if self.SelectedRG == "3801" || self.SelectedRG == "5031" || self.SelectedRG == "5268AC" {
            performSegue(withIdentifier: "PaceRG1", sender: nil)
        }
        
        //If RG Model is of Motorolla/AARIS manufacture then goto AARIS Instructions
        if self.SelectedRG == "NVG589" || self.SelectedRG == "NVG599" || self.SelectedRG == "BGW210" {
            performSegue(withIdentifier: "ARRISRG1", sender: nil)
        }
        
    }
    
    
    //Set Variables to send to Selected RG during segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PaceRG1" {
            let SegueViewController = segue.destination as! PaceRG1ViewController
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
        
        if segue.identifier == "ARRISRG1" {
            let SegueViewController = segue.destination as! ARRISRG1ViewController
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
