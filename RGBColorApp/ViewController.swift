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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UIView
        colorView.layer.cornerRadius = 15
        
        // Add done button on keyboard
        addDoneButtonOnKeyboard()
        
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
    }
    
    // Action when done button pressed
    @objc func donePressed() {
        
        addCustomColorForView()
        
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    
    // Change color value through UISlider
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
    
    // Change color value through UITextField
    private func addCustomColorForView() {
        
        guard let redTextFieldValue = Float(redTextField.text!) else {
            showAlert(title: "Error!",
                      message: "Enter a correct number")
            return
        }
        
        guard let greenTextFieldValue = Float(greenTextField.text!) else {
            showAlert(title: "Error!",
                      message: "Enter a correct number")
            return
        }
        
        guard let blueTextFieldValue = Float(blueTextField.text!) else {
            showAlert(title: "Error!",
                      message: "Enter a correct number")
            return
        }
        
        // Сheck the number
        if redTextFieldValue > redSlider.maximumValue {
            showAlert(title: "Error!",
                      message: "The number exceeds 1, enter the correct number")
        }
        
        if greenTextFieldValue > redSlider.maximumValue {
            showAlert(title: "Error!",
                      message: "The number exceeds 1, enter the correct number")
        }
        
        if blueTextFieldValue > redSlider.maximumValue {
            showAlert(title: "Error!",
                      message: "The number exceeds 1, enter the correct number")
        }
        
        // Assign a custom value
        redSlider.value = redTextFieldValue
        redLabel.text = String(format: "%.2f", redSlider.value)
        
        greenSlider.value = greenTextFieldValue
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        
        blueSlider.value = blueTextFieldValue
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    // Create a done button on keyboard
    private func addDoneButtonOnKeyboard() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: Selector(("donePressed")))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        toolBar.tintColor = .darkGray
        
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // Touching beyond the keyboard
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        redTextField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        addCustomColorForView()
        
        self.view.endEditing(true);
    }
}

extension ViewController {
    
    // Create alert notification
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
