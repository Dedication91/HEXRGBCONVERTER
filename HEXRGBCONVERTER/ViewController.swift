//
//  ViewController.swift
//  HEXRGBCONVERTER
//
//  Created by Shaan Mirchandani
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitleOUTLET: UILabel!
    @IBOutlet weak var sgmChooseConversionOUTLET: UISegmentedControl!
    @IBOutlet weak var txtField1OUTLET: UITextField!
    @IBOutlet weak var txtField2OUTLET: UITextField!
    @IBOutlet weak var txtField3OUTLET: UITextField!
    @IBOutlet weak var btnConvertOUTLET: UIButton!
    @IBOutlet weak var lblFinalResultsOUTLET: UILabel!
    
    var hexPart1: String?
    var hexPart2: String?
    var hexPart3: String?
    var redValue: Int?
    var greenValue: Int?
    var blueValue: Int?
    var conversionType: String = "Hex To RGB"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func chooseConverstionTypeACTION(_ sender: UISegmentedControl) {
   
        switch sgmChooseConversionOUTLET.selectedSegmentIndex {
        case 0:
            conversionType = "Hex To RGB"
            txtField1OUTLET.placeholder = "1st and 2nd Hex characters"
            txtField2OUTLET.placeholder = "3rd and 4th Hex characters"
            txtField3OUTLET.placeholder = "5th and 6th Hex characters"
            txtField1OUTLET.keyboardType = UIKeyboardType.default
            txtField2OUTLET.keyboardType = UIKeyboardType.default
            txtField3OUTLET.keyboardType = UIKeyboardType.default
            
        case 1:
            conversionType = "RGB To HEX"
            txtField1OUTLET.placeholder = "Red value"
            txtField2OUTLET.placeholder = "Green value"
            txtField3OUTLET.placeholder = "Blue value"
            txtField1OUTLET.keyboardType = UIKeyboardType.decimalPad
            txtField2OUTLET.keyboardType = UIKeyboardType.decimalPad
            txtField3OUTLET.keyboardType = UIKeyboardType.decimalPad
            
        default:
            conversionType = "Hex to RGB"
        }
        
    }
    @IBAction func pressConvertButtonACTION(_ sender: UIButton) {
        switch conversionType {
        case "Hex to RGB":
            if (assignHexValues() == true){
                convertHexToInt()
                displayRGBValues()
            }

        case "RGB to Hex":
            if (assignRGBValues() == true){
                convertIntToHex()
                displayHexValue()
            }
        default:
            break
        }
        txtField1OUTLET.text?.removeAll()
        txtField2OUTLET.text?.removeAll()
        txtField3OUTLET.text?.removeAll()

    }
    
    
    
    func assignHexValues() -> Bool {
        if (!txtField1OUTLET.hasText || !txtField2OUTLET.hasText || !txtField3OUTLET.hasText) {
            return false
        } else {
        hexPart1 = txtField1OUTLET.text
        hexPart2 = txtField2OUTLET.text
        hexPart3 = txtField3OUTLET.text
        }
        return true
        
    }
    
    func assignRGBValues() -> Bool{
        if !(txtField1OUTLET.hasText || !txtField2OUTLET.hasText || !txtField3OUTLET.hasText){
            
        return false
        } else {
        redValue = Int(txtField1OUTLET.text!)
        greenValue = Int(txtField2OUTLET.text!)
        blueValue = Int(txtField3OUTLET.text!)
        }
        return true
        
    }
    
    func convertHexToInt() {
        redValue = strtol(hexPart1, nil, 16)
        greenValue = strtol(hexPart2, nil, 16)
        blueValue = strtol(hexPart3, nil, 16)
        
    }
    
    func displayRGBValues() {
        lblFinalResultsOUTLET.text = "Red value is: " + String(redValue!) + ", green value is: " + String(greenValue!) + ", and blue value is: " + String(blueValue!)
                lblFinalResultsOUTLET.backgroundColor = UIColor.init(red: CGFloat(redValue!)/255, green: CGFloat(greenValue!)/255, blue: CGFloat(blueValue!)/255, alpha: 1)
        
    }
    
    func convertIntToHex(){
        hexPart1 = String(format: "0.2x", redValue!)
        hexPart2 = String(format: "0.2x", greenValue!)
        hexPart3 = String(format: "0.2x", blueValue!)
        
        
    }
    
    func displayHexValue(){
        lblFinalResultsOUTLET.text = "Hexcode value is: 0x" + hexPart1! + hexPart2! + hexPart3!
            lblFinalResultsOUTLET.backgroundColor = UIColor.init(red: CGFloat(redValue!)/255, green: CGFloat(greenValue!)/255, blue: CGFloat(blueValue!)/255, alpha: 1)
    }


}

