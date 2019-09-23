//
//  ViewController.swift
//  Calculator
//
//  Created by William Wall on 23/09/2019.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // current number on screen
    var numberOnScreen:Double = 0
    
    // previous number on screen
    var previousNumber:Double = 0
    
    // boolean for performing math
    var performingMath = false
    
    var operation = 0
    
    // label from storyboard
    @IBOutlet weak var label: UILabel!
    
    // all numbers linked to this function
    @IBAction func numbers(_ sender: UIButton)
    {
        // if performing math is true
        if performingMath == true
        {
            // set the text to the number of tag button (-1 because buttons start at +1)
            label.text = String(sender.tag-1)
            // equal the number on screen to the double value
            numberOnScreen = Double(label.text!)!
            // stop performing math by setting boolean to false
            performingMath = false
        }
        else // if performing math is equal to false
        {
            // the text is equal to the text plus new text
            label.text = label.text! + String(sender.tag-1)
            // number on screen is a double
            numberOnScreen = Double(label.text!)!
        }
        
        
    }
    
    // all mathematical function buttons are linked here
    @IBAction func buttons(_ sender: UIButton)
    {
        // if the text label is blank and button cancel and button equal not clicked.
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            // set previous number
            previousNumber = Double(label.text!)!
            // set text based on button tags
            if sender.tag == 12 // divide
            {
                label.text = "/"
                
            }
            else if sender.tag == 13 // multiply
            {
                label.text = "*"
                
            }
            else if sender.tag == 14 // minus
            {
                label.text = "-"
                
            }
            else if sender.tag == 15 // plus
            {
                label.text = "+"
            }
            // set operation as tag
            operation = sender.tag
            // performing math is now true
            performingMath = true
        }
        else if sender.tag == 16 // if equals button is clicked
        {
            if operation == 12 // calc /
            {
                label.text = String(previousNumber / numberOnScreen)
                
            }
            else if operation == 13 // calc *
            {
                label.text = String(previousNumber * numberOnScreen)
                
            }
            else if operation == 14 // calc -
            {
                label.text = String(previousNumber - numberOnScreen)
                
            }
            else if operation == 15 // calc +
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 // if cancel is hit clear everything
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

