//
//  ViewController.swift
//  Controls Practice
//
//  Created by Evgeniy Goncharov on 01.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    var number: UInt8 = 128 {
        didSet {
            updateUI()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        rotateSwitches()
        // Do any additional setup after loading the view.
    }
    
    func rotateSwitches() {
        for `switch` in switches {
            `switch`.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        }
    }
    
    /// Update number from switches
    func updateNamberFromSwitches() {
        var number = 0
        for `switch` in switches {
            number += `switch`.isOn ? `switch`.tag : 0
        }
        self.number = UInt8(number % 256)
    }
    
    /// Update switches from the number
    func updateSwitches() {
        for `switch` in switches {
            `switch`.isOn = Int(number) & `switch`.tag != 0
        }
    }
    
    /// Updates all outlets to number
    func updateUI() {
        button.setTitle("\(number)", for: [])
        updateSwitches()
        slider.value = Float(number)
        textField.text = "\(number)"
    }

    @IBAction func buttonPressed() {
        number = UInt8((Int(number) + 1) % 256)

    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        updateNamberFromSwitches()
        print(#line, #function, sender.tag)
    }
    @IBAction func sliderMoved() {
        number = UInt8(slider.value)
    }
    @IBAction func textFieldEdited() {
        print(#line, #function)
        number = UInt8(textField.text ?? "") ?? 128
    }
}

