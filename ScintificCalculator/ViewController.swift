//
//  ViewController.swift
//  ScintificCalculator
//
//  Created by Venkatram G V on 20/09/22.


import UIKit
import Foundation

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var performMath: Bool = false
    var previousNumber: Double = 0
    var operation = 0
    var memory:[Double] = []
    func factorial(x: Double) -> Double{
        var outPut = 1
        if x > 0{
            for i in 1...Int(x){
                outPut *= i
            }
        }
        return Double(outPut)
    }
    func sindeg(degrees: Double) -> Double {
        return sin(degrees * Double.pi / 180.0)
    }
    func cosdeg(degrees: Double) -> Double {
        return cos(degrees * Double.pi / 180.0)
    }
    func tandeg(degrees: Double) -> Double {
        return tan(degrees * Double.pi / 180.0)
    }
    func root(input: Double, base: Double) -> Double {
        var output = 0.0
        var add = 0.0
        while add < 16.0 {
            while pow(output, base) <= input {
                output += pow(10.0, (-1.0 * add))
            }
            output -= pow(10.0, (-1.0 * add))
            add += 1.0
        }
        return output + 0.0
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numberButtons(_ sender: UIButton){
        
        if performMath == true{
            textLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(textLabel.text!)!
            performMath = false
        } else {
            
            if textLabel.text == "0"{
                sender.tag == 17 ?
                (textLabel.text = "0.") : (textLabel.text = String(sender.tag - 1))
                
                numberOnScreen = Double(textLabel.text!)!
            } else {
                sender.tag == 17 ?
                (textLabel.text = textLabel.text! + ".") : (textLabel.text = textLabel.text! + String(sender.tag - 1))
                
                numberOnScreen = Double(textLabel.text!)!
            }
            
            
        }
    }
    var arr = [20,21,22,23,24,25,26,29,30,31,32,33,34,36,37,38,39,40,41,42]
    @IBAction func mathButtonTapped(_ sender: MyButton){
        
        if textLabel.text != "" && sender.tag != 16 && sender.tag != 11 && !arr.contains(sender.tag){
            
            previousNumber = Double(textLabel.text!)!
            if sender.tag == 12 { //Divide
                textLabel.text = "/"
            }
            
            if sender.tag == 13 { //Multiply
                textLabel.text = "x"
            }
            
            if sender.tag == 14 { //Subtract
                textLabel.text = "-"
            }
            
            if sender.tag == 15 { //Add
                textLabel.text = "+"
            }
            
            if sender.tag == 27{ // ^
                textLabel.text = String(previousNumber)
            }
            
            if sender.tag == 35{ // root
                textLabel.text = String(previousNumber)
            }
            
            operation = sender.tag
            performMath = true
            
        }
        
        else if sender.tag == 16 { // equal to
            
            if operation == 12{ //Divide
                textLabel.text = String(previousNumber / numberOnScreen)
            }
            
            else if operation == 13{ //Multiply
                textLabel.text = String(previousNumber * numberOnScreen)
            }
            
            else if operation == 14{ //Subtract
                textLabel.text = String(previousNumber - numberOnScreen)
            }
            
            else if operation == 15{ //Add
                textLabel.text = String(previousNumber + numberOnScreen)
            }
            
            else if operation == 27{ // x^y
                textLabel.text = String(pow(previousNumber, numberOnScreen))
            }
            else if operation == 35{ // y root x
                textLabel.text = String(root(input: previousNumber, base: numberOnScreen))
            }
            
        }
        
        else if sender.tag == 11{ //clear
            textLabel.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
        else if sender.tag == 20{ // pi
            textLabel.text = String(Double.pi)
        }
        
        else if sender.tag == 21{ // e
            textLabel.text = String(exp(1.0))
        }
        
        else if sender.tag == 22{ // e(x)
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(exp(previousNumber))
        }
        
        else if sender.tag == 23{ // 2 root x
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(sqrt(previousNumber))
        }
        
        else if sender.tag == 24{ // 3 root x
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(cbrt(previousNumber))
        }
        
        else if sender.tag == 25{ // x^2
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(pow(previousNumber, 2))
        }
        
        else if sender.tag == 26{ // x^3
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(pow(previousNumber, 3))
        }
        
        else if sender.tag == 29{ // 10^x
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(pow(10, previousNumber))
        }
        
        else if sender.tag == 30{ // 1/x
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(1/previousNumber)
        }
        
        else if sender.tag == 31{ // x!
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(factorial(x: previousNumber))
        }
        
        else if sender.tag == 32{ //sin
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(sindeg(degrees: previousNumber))
        }
        
        else if sender.tag == 33{ //cos
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(cosdeg(degrees: previousNumber))
        }
        
        else if sender.tag == 34{ //tan
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(tandeg(degrees: previousNumber))
        }
        
        else if sender.tag == 36{ //ln
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(log(previousNumber))
        }
        
        else if sender.tag == 37{ // %
            previousNumber = Double(textLabel.text!)!
            textLabel.text = String(previousNumber/100)
        }
        
        else if sender.tag == 38{ // +/-
            previousNumber = Double(textLabel.text!)!
            previousNumber > 0 ? (textLabel.text = String(-previousNumber)) : (textLabel.text = String(-previousNumber))
        }
        
        else if sender.tag == 39{ // m+
            previousNumber = Double(textLabel.text!)!
            memory.append(previousNumber)
            print("+", memory)
        }
        
        else if sender.tag == 40 { // m-
            print(memory.count)
            memory.remove(at: memory.count-1)
            print("-", memory)
            
        }
        
        else if sender.tag == 41{ // mr
            if memory.count > 0{
                textLabel.text = String(memory[memory.count-1])
            }
        }
        
        else if sender.tag == 42{ // mc
            memory.removeAll()
        }
        
    }
    
}

