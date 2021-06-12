//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Justin Schwartz on 6/12/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UITraitCollection.current.userInterfaceStyle == .dark {
            darkToggle.isOn = true
        } else {
            darkToggle.isOn = false
        }
    }
    
    @IBAction func toggledDark(_ sender: Any) {
        if darkToggle.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        } else {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
