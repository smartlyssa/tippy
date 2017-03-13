//
//  ViewController.swift
//  tippy
//
//  Created by Lyssa on 3/9/17.
//  Copyright © 2017 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billCurrencySymbol: UILabel!
    @IBOutlet weak var tipCurrencySymbol: UILabel!
    @IBOutlet weak var totalCurrencySymbol: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        
        billField.text = String(format: "%.2f",Double(billField.text!) ?? 0)
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipLabel.text = String(format: "%.2f",tip)
        totalLabel.text = String(format: "%.2f",total)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
    }
    
    @IBAction func onBillEdit(_ sender: Any) {
        billField.text = ""
        tipLabel.text = String(format: "%.2f",0)
        totalLabel.text = String(format: "%.2f",0)
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "defaultTipValue") != nil) {
            let intValue = defaults.integer(forKey: "defaultTipValue")
            tipControl.selectedSegmentIndex = intValue
        }
        
    }
    
}

