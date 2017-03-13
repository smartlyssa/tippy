//
//  SettingsViewController.swift
//  tippy
//
//  Created by Lyssa on 3/9/17.
//  Copyright © 2017 thegeekgoddess.net. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "defaultTipValue") != nil) {
            let intValue = defaults.integer(forKey: "defaultTipValue")
            defaultTipSegControl.selectedSegmentIndex = intValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func changeDefaultTip(_ sender: AnyObject) {
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipSegControl.selectedSegmentIndex, forKey: "defaultTipValue")
        defaults.synchronize()
        print("defaultTipValue updated: \(defaultTipSegControl.selectedSegmentIndex)")
        
    }

}
