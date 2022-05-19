//
//  ViewController.swift
//  CalculatorPlus
//
//  Created by Venkatram G V on 17/05/22.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var screenView: UILabel!
    @IBOutlet weak var resultView: UILabel!
    var calc: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIButton.appearance().borderWidth = 10
        UIButton.appearance().cornerRadius = 50
        clearAll()
    }
    
    func clearAll(){
        calc = ""
        screenView.text = ""
        resultView.text = ""
        
    }
    
    func addToCalc(value: String){
        calc = calc + value
        screenView.text = calc
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if(!calc.isEmpty){
            calc.removeLast()
            resultView.text = calc
        }
    }
    
    @IBAction func percentageButton(_ sender: UIButton) {
        addToCalc(value: "%")
        
    }
    
    @IBAction func divisionButton(_ sender: UIButton) {
        addToCalc(value: "/")
    }
    
    // ---
    
    
    @IBAction func button_7(_ sender: UIButton) {
        addToCalc(value: "7")
    }
    
    @IBAction func button_8(_ sender: UIButton) {
        addToCalc(value: "8")
    }
    
    @IBAction func button_9(_ sender: UIButton) {
        addToCalc(value: "9")
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        addToCalc(value: "*")
    }
    
    // ---
    
    @IBAction func button_4(_ sender: UIButton) {
        addToCalc(value: "4")
    }
    
    @IBAction func button_5(_ sender: UIButton) {
        addToCalc(value: "5")
    }
    
    @IBAction func button_6(_ sender: UIButton) {
        addToCalc(value: "6")
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        addToCalc(value: "-")
    }
    
    // ---
    
    
    @IBAction func button_1(_ sender: UIButton) {
        addToCalc(value: "1")
    }
    
    @IBAction func button_2(_ sender: UIButton) {
        addToCalc(value: "2")
    }
    
    @IBAction func button_3(_ sender: UIButton) {
        addToCalc(value: "3")
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        addToCalc(value: "+")
    }
    
    // ---
    
    
    @IBAction func button_0(_ sender: UIButton) {
        addToCalc(value: "0")
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        addToCalc(value: ".")
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if (isValid()){
            
            let forPercentage = calc.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: forPercentage)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formateResult(result: result)
            resultView.text = resultString
            
        }else{
            let alert = UIAlertController(title: "Invalid Input",
                                          message: "Caluclater unable to do the calculation ",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func specialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func isValid() -> Bool{
        var count: Int = 0
        var charIndex = [Int]()
        for char in calc{
            if(specialCharacter(char: char)){
                charIndex.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in charIndex{
            if (index == 0){
                return false
            }else if(index == calc.count-1){
                return false
            }else if(previous != -1){
                if ((index - previous) == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func formateResult(result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    // ---
    
}
@objc extension UIButton{
    dynamic var borderColor: UIColor?{
        get{
            if let cgColor = layer.borderColor{
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set{
            layer.borderColor = newValue?.cgColor
        }
    }
    
    dynamic var borderWidth: CGFloat{
        get{return layer.borderWidth}
        set{layer.borderWidth = newValue}
    }
    
    dynamic var cornerRadius: CGFloat{
        get{return layer.cornerRadius}
        set{layer.cornerRadius = newValue}
    }
}



