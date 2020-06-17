//
//  MainViewController.swift
//  Static IP Trainer
//
//  Created by Justin Kumpe on 3/18/18.
//  Copyright © 2018 Justin Kumpe. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate {
    
    //MARK: Set Declared Values
    @IBOutlet weak var BlockSizePicker: UIPickerView!
    @IBOutlet weak var IPO1: UITextField!
    @IBOutlet weak var IPO2: UITextField!
    @IBOutlet weak var IPO3: UITextField!
    @IBOutlet weak var IPO4: UITextField!
    var IPO1txt = ""
    var BlockSize = ""
    var RGIPO4 = ""
    var LUIPO4 = ""
    var FUIPO4 = ""
    var BlockSize2 = 0
    var RGAdd = 0
    var LUAdd = 0
    var SubnetMask = ""
    let FUAdd = 1
    let PrimaryDNS = "68.94.156.1"
    let SecondaryDNS = "68.94.157.1"
    
    //MARK: Set Options Array for Block Size Picker
    var SelectBlockSize = ["Select Block Size", "8", "16", "32", "64"]
    
    //MARK: viewDid Load
    override func viewDidLoad() {
        super.viewDidLoad()
        //Run Block Size Picker
        BlockSizePicker.delegate = self
        BlockSizePicker.dataSource = self
        
    }
    
    //MARK: Configure Block Size Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SelectBlockSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SelectBlockSize[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.BlockSize = SelectBlockSize[row]
    }
    
    //MARK: Run when Next Button is Pressed
    @IBAction func NextButtonPressed(_ sender: Any) {
        
        //If any field is blank then Show Alert (Missing Information Alert) ELSE Set options for specified block size
        if self.BlockSize == "Select Block Size" || self.BlockSize == "" || IPO4.text?.isEmpty ?? true || IPO3.text?.isEmpty ?? true || IPO2.text?.isEmpty ?? true || IPO1.text?.isEmpty ?? true {
            showAlert()
        } else {
        if self.BlockSize == "8" {
            self.RGAdd = 6
            self.LUAdd = 5
            self.SubnetMask = "255.255.255.248"
        }
        if self.BlockSize == "16" {
            self.RGAdd = 14
            self.LUAdd = 13
            self.SubnetMask = "255.255.255.240"
        }
        if self.BlockSize == "32" {
            self.RGAdd = 30
            self.LUAdd = 29
            self.SubnetMask = "255.255.255.224"
        }
        if self.BlockSize == "64" {
            self.RGAdd = 62
            self.LUAdd = 61
            self.SubnetMask = "255.255.255.192"
        }
            
            //MARK: Calculate RG IP, Last Usable IP, and First Usable IP
        self.RGIPO4 = String(Int(self.IPO4.text!)! + Int(self.RGAdd))
        self.LUIPO4 = String(Int(self.IPO4.text!)! + Int(self.LUAdd))
        self.FUIPO4 = String(Int(self.IPO4.text!)! + Int(self.FUAdd))
            
            //Show Message (Display Static IP Info Alert)
            showIPMessage()
        }
    }
    
    //MARK: Missing Information Alert
    @IBAction func showAlert() {
        //Configure Alert
        let alertController = UIAlertController(title: "Missing Information", message:
            "Please enter IP Address \nand select Block Size", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
        
        //Display Alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Display Static IP Info Message
    //UIAlertControllerStyle.actionSheet shows message at bottom of screen instead of an alert in center of screen
    @IBAction func showIPMessage() {
        //Configure Message
        let alertController = UIAlertController(title: "Static IP Information", message:
            "First Usable: \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.FUIPO4)\nLast Usable: \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.LUIPO4)\nRG IP: \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.RGIPO4)\nSubnet Mask: \(self.SubnetMask)\nPrimary DNS: \(self.PrimaryDNS)\nSecondaryDNS: \(self.SecondaryDNS)", preferredStyle: UIAlertController.Style.alert)
        
        let alertButton1 = UIAlertAction(title: "Email", style: UIAlertAction.Style.default,handler: sendEmail)
        let alertButton2 = UIAlertAction(title: "Next", style: UIAlertAction.Style.default,handler: SelectRG)
        alertController.addAction(alertButton1)
        alertController.addAction(alertButton2)
        //Display Message
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Hide Keyboard
    //Hides Keyboard when user touches outside of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Mark: Send Email
    //Sends email with Uverse Static IP Information as Calculated
    func sendEmail(action: UIAlertAction) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([""])
            mail.setSubject("Static IP Address Information")
            mail.setMessageBody("<b><u>Below is your Static IP Information</b></u><br><b>Usable IP Range:</b> \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.FUIPO4) - \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.LUIPO4)<br><b>RG/Default Gateway:</b> \(self.IPO1.text!).\(self.IPO2.text!).\(self.IPO3.text!).\(self.RGIPO4)<br><b>Subnet Mask:</b> \(self.SubnetMask)<br><b>Primary DNS:</b> \(self.PrimaryDNS)<br><b>SecondaryDNS:</b> \(self.SecondaryDNS)", isHTML: true)
            
            present(mail, animated: true)
        } else {
        //Alert if Error
            //Configure Alert
            let alertController = UIAlertController(title: "Mail Launch Error", message:
                "An Error Occured while trying to launch the Mail App.\nEither the Mail App is not installed or not configured!", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.destructive,handler: nil))
            
            //Display Alert
            self.present(alertController, animated: true, completion: nil)
        }
    }
    //Close Mail App on Send/Cancel/Error
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        performSegue(withIdentifier: "SelectRG", sender: nil)
    }
    
    func SelectRG(action: UIAlertAction){
        performSegue(withIdentifier: "SelectRG", sender: nil)
    }
    
    //Set Variables to send to Select RG during segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRG" {
            let SegueViewController = segue.destination as! SelectRGViewController
            SegueViewController.IPO1 = self.IPO1.text!
            SegueViewController.IPO2 = self.IPO2.text!
            SegueViewController.IPO3 = self.IPO3.text!
            SegueViewController.FUIPO4 = self.FUIPO4
            SegueViewController.LUIPO4 = self.LUIPO4
            SegueViewController.RGIPO4 = self.RGIPO4
            SegueViewController.SubnetMask = self.SubnetMask
            SegueViewController.PrimaryDNS = self.PrimaryDNS
            SegueViewController.SecondaryDNS = self.SecondaryDNS
        }
    }
}

