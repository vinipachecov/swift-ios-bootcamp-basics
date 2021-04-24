//
//  ViewController.swift
//  IOS-Calculator
//
//  Created by vinicius p  vieira on 24/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equationLabel: UILabel!
    
    let ErrorString = "Invalid Expression"
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
            
    @IBAction func onAddValue(sender: UIButton) {
        if equationLabel.text == "0" {
            equationLabel.text = (sender.currentTitle ?? "")
        } else {
            equationLabel.text = (equationLabel.text ?? "") + (sender.currentTitle ?? "")
        }
    }
    
    @IBAction func onClear(sender: UIButton) {
        equationLabel.text = "0"
    }
    
    @IBAction func onCalculateResult(sender: UIButton) {
        let equationString = (equationLabel.text?.replacingOccurrences(of: "x", with: "*") ?? "")
        
        // actually calculate the value of the expression
        let expression = NSExpression(format: equationString)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            equationLabel.text = result.stringValue
        } else {
            equationLabel.text = "0"
        }
    }
}

