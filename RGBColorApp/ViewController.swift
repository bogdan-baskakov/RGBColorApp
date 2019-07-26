//
//  ViewController.swift
//  RGBColorApp
//
//  Created by Bogdan Baskakov on 26/07/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UIView
        colorView.layer.cornerRadius = 15
        
        // Add done button on keyboard
        addDoneButtonOnKeyboard()
    }
    
    @objc func doneClicked() {
        
        guard redTextField.text?.isEmpty == false else { return }
        guard greenTextField.text?.isEmpty == false else { return }
        guard blueTextField.text?.isEmpty == false else { return }
        
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        guard redTextField.text?.isEmpty == false else { return }
        guard greenTextField.text?.isEmpty == false else { return }
        guard blueTextField.text?.isEmpty == false else { return }
        
        self.view.endEditing(true)
    }
    
    // MARK: - IBAction
    
    @IBAction func sliderAction() {
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - Private Methods
    
    private func addDoneButtonOnKeyboard() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: Selector(("doneClicked")))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }

}
