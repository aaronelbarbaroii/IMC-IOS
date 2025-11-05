//
//  ViewController.swift
//  IMC-IOS
//
//  Created by Mananas on 3/11/25.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    
    @IBOutlet weak var weightStepper: UIStepper!
    
    @IBOutlet weak var HeightSlider: UISlider!

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var estado: UILabel!
    
    
    var weight = 70
    var height = 170
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculateButton()
    }

    
    @IBAction func weightStepper(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
        calculateButton()
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
        calculateButton()
    }
    
    func calculateButton() {
        let result = ("\(Double(weight)/pow(Double(height)/100.0, 2))")
        resultLabel.text = String(format: "%.2f", Double(result)!)
        estado.text = estadoIMC(imc: Double(result)!)
    }
    
    func estadoIMC(imc: Double) -> String {
        if imc < 18.5 {
            estado.textColor = .bmiColorUnderweight
            resultLabel.textColor = .bmiColorUnderweight
            return "Bajo peso"
        } else if imc < 24.9 {
            estado.textColor = .bmiColorNormal
            resultLabel.textColor = .bmiColorNormal
            return "Peso saludable"
        } else if imc < 29.9 {
            estado.textColor = .bmiColorOverweight
            resultLabel.textColor = .bmiColorOverweight
            return "Sobrepeso"
        } else if imc < 34.9 {
            estado.textColor = .bmiColorObesity
            resultLabel.textColor = .bmiColorObesity
            return "Obesidad"
        }
        else {
            estado.textColor = .bmiColorExtremeObesity
            resultLabel.textColor = .bmiColorExtremeObesity
            return "Obesidad mórbida"
        }
    }
    
}
