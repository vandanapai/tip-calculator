//
//  ViewController.swift
//  tip-calculator
//
//  Created by Vandana Pai on 1/16/17.
//  Copyright © 2017 Vandana Pai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var totalppLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapScreen(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(sender: AnyObject) {
        stepperValue.text = Int(stepper.value).description
    }

    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let splitNum = Double(stepper.value) ?? 0
        print(stepper.value)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalPerPerson = total / splitNum
        
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalppLabel.text = String(format: "$%.2f", totalPerPerson)

        
    }

}

