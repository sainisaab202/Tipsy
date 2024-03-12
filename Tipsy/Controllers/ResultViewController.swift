//
//  ResultViewController.swift
//  Tipsy
//
//  Created by GurPreet SaiNi on 2024-03-11.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblSplitInfo: UILabel!
    
    var splitAmount: Float?
    var splitInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setting text that we receive from previous screen
        lblAmount.text = String(format: "%.2f", splitAmount ?? 0.0)
        lblSplitInfo.text = splitInfo ?? "per person should pay"
    }
    
    @IBAction func btnRecalculateTouchUp(_ sender: UIButton) {
        //to go back to previous screen
        self.dismiss(animated: true)
    }

}
