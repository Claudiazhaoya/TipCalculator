//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Zhaoya Sun on 11/4/17.
//  Copyright © 2017 CodePath University. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var transformLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var bill = ""
    var selectedRowIndex = 0
    var currencies = ["RMB￥", "GBP￡", "EUR€","CAD$"]
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.text = "$\(bill)"
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRowIndex = row
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
//        let usd = Double(billTextField.text!) ?? 0
        let usd = Double(bill) ?? 0
  
        if (selectedRowIndex == 0) {
            transformLabel.text = String(format: "￥%.2f", usd*6.95)
        }
            
        else if(selectedRowIndex == 1) {
            transformLabel.text = String(format: "￡%.2f", usd*0.8115)
        }
        else if (selectedRowIndex == 2) {
            transformLabel.text = String(format: "€%.2f", usd*0.9511)
        }
        else {
            transformLabel.text = String(format: "C$%.2f", usd*1.3280)
        }
    }

}
