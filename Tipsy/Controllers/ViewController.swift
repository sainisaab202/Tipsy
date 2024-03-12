//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtBillAmount: UITextField!
    
    @IBOutlet weak var btnZeroPct: UIButton!
    @IBOutlet weak var btnTenPct: UIButton!
    @IBOutlet weak var btnTwentyPct: UIButton!
    
    @IBOutlet weak var lblSplitNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTipChangeTouchUp(_ sender: UIButton) {
        
        txtBillAmount.endEditing(true)
        
        if sender == btnZeroPct{
            btnZeroPct.isSelected = true
            btnTenPct.isSelected = false
            btnTwentyPct.isSelected = false
        }else if sender == btnTenPct{
            btnZeroPct.isSelected = false
            btnTenPct.isSelected = true
            btnTwentyPct.isSelected = false
        }else if sender == btnTwentyPct{
            btnZeroPct.isSelected = false
            btnTenPct.isSelected = false
            btnTwentyPct.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblSplitNumber.text = String(Int(sender.value))
    }
    
    @IBAction func btnCalculateTouchUp(_ sender: UIButton) {
        let tipPercent = btnZeroPct.isSelected ? 0.0 : btnTenPct.isSelected ? 0.1 : 0.2
        let splitNumber = Float(lblSplitNumber.text ?? "2")
        let amount = Float(txtBillAmount.text ?? "0.0")
        
        print(tipPercent)
        print("Split number: \(splitNumber)")
        print("Amount to split: \(amount)")
        
        var total =
        
        print("Per person amount: ")
    }
    
}

