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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)        
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
//        tipLabel.text = "$ \(tip)"
//        totalLabel.text = "$ \(total)"
        
        tipLabel.text = String(format: "$ %.2f",tip)
        totalLabel.text = String(format: "$ %.2f",total)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTipValue")
        
        print("load value from NSUserDefaults: \(intValue)")
        
        if (defaults.object(forKey: "defaultTipValue") != nil) {
            tipControl.selectedSegmentIndex = intValue
        }
        
//        let intValue = defaults.integerForKey("another_key_that_you_choose")
    }
    
}

