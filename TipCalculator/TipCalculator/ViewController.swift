//
//  ViewController.swift
//  TipCalculator
//
//  Created by Zhaoya Sun on 11/4/17.
//  Copyright © 2017 CodePath University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
          let vc = segue.destination as! SettingsViewController
          print(self.billTextField.text!)
          vc.bill = self.billTextField.text!
    }
    
//    @IBAction func buttonItemTapped(_ sender: Any) {
//        print("Hello!!!!")
//        let vc = SettingsViewController()
//        print("Hellllooooo")
//        print(billTextField.text!)
//        vc.billTextField.text = self.billTextField.text
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[TipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    

}

