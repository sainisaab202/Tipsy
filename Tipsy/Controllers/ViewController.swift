//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var splitAmount: Float = 0.0
    var splitInfo = ""

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
        // will hide the keyboard from screen when we touch any of the tip button
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
        let tipPercent = Float(btnZeroPct.isSelected ? 0.0 : btnTenPct.isSelected ? 0.1 : 0.2)
        let splitNumber = Float(lblSplitNumber.text ?? "2")
        let amount = Float(txtBillAmount.text ?? "0.0") ?? Float(0.0)
        
        print(tipPercent)
        print("Split number: \(splitNumber!)")
        print("Amount to split: \(amount)")
        
        let total = (amount + (amount * tipPercent)) / Float(splitNumber!)
        
        print("Per person amount: \(total)")
        
        splitAmount = total
        splitInfo = "Split between \(Int(splitNumber!)) people, with \(Int(tipPercent*100))% tip"
        
        //launching result screen
        performSegue(withIdentifier: "goToResultView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResultView"){
            
            //sending additional info to another view
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.splitAmount = splitAmount
            resultViewController.splitInfo = splitInfo
            
        }
    }
    
}

