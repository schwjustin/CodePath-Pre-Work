//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Justin Schwartz on 6/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitToggle: UISwitch!
    @IBOutlet weak var staticTotalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderVal: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var perPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        if (defaults.object(forKey: "bill") != nil) {
            let bill = defaults.double(forKey: "bill")
            billAmountTextField.text = String(format: "%.2f", bill)
            calculateTip(self)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        billAmountTextField.resignFirstResponder()
    }

    @IBAction func toggle(_ sender: Any) {
        if splitToggle.isOn {
            staticTotalLabel.isHidden = true
            totalLabel.isHidden = true
            slider.isHidden = false
            sliderVal.isHidden = false
            totalPerPerson.isHidden = false
            perPerson.isHidden = false
        } else {
            staticTotalLabel.isHidden = false
            totalLabel.isHidden = false
            slider.isHidden = true
            sliderVal.isHidden = true
            totalPerPerson.isHidden = true
            perPerson.isHidden = true
        }
    }
    
    @IBAction func slide(_ sender: Any) {
        calculateTip(sender)
    }
    
    @IBAction func calculate(_ sender: Any) {
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let val = Double(Int(slider.value))
        let eachTotal = total / val
        
        sliderVal.text = String(format: "%.0f", val)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perPerson.text = String(format: "$%.2f", eachTotal)
        
        defaults.set(bill, forKey: "bill")
        defaults.synchronize()
    }
}

