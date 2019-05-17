//
//  ViewController.swift
//  randomize
//
//  Created by Dima on 02/02/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelRandomize: UILabel!
    @IBOutlet weak var btnRandomize: UIButton!
    @IBOutlet weak var textFieldMinValue: UITextField!
    @IBOutlet weak var textFieldMaxValue: UITextField!
    @IBOutlet weak var btnClearLastTenNumber: UIButton!
    @IBOutlet weak var lblTenNumbers: UILabel!
    
    
    
    var minValue = 0
    var maxValue = 0
    
    var lastTenNumbersArray = [Int]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad() // настраиваем внешний вид кнопок и лейблов
        
        labelRandomize.text = "0" // set the value for label
        labelRandomize.backgroundColor = UIColor(red: 127/255.0, green: 127/255.0, blue: 127/255.0, alpha: 0.2) // устанавливаем цвет для лейбла
        labelRandomize.textAlignment = NSTextAlignment.center // выравниваем символы в лейбле
        labelRandomize.adjustsFontSizeToFitWidth = true // авто уменьшение
        
        btnRandomize.layer.cornerRadius = 10 // скругляем углы у кнопки
        btnRandomize.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0) // устанавливаем цвет кнопки
        
        btnClearLastTenNumber.layer.cornerRadius = 10
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        randomize() // включаем функцию при тряске телефона
    }
    
    func randomize() {
        
        let rndNumber = Int.random(in: minValue...maxValue)
        labelRandomize.text = String(rndNumber)
        
        lastTenNumbersArray.append(rndNumber)
        print(lastTenNumbersArray)
        
        if lastTenNumbersArray.count == 11 {
            lastTenNumbersArray.remove(at: 0)} // если значений массива 11, удаляем из массива первый элемент
        
        
        lblTenNumbers.text = "\(lastTenNumbersArray)" // печатаем в лейбле значения массива
        
        
        
    }
    
    
    
    
    @IBAction func btnRandomAction(_ sender: Any) {
        
        if textFieldMinValue.text!.isEmpty { // проверяет значение в поле minValue и выводит алерт
            
        let alertController = UIAlertController(title: "Внимание!", message: "Введите минимальное значение!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            
        } else {
            minValue = (Int(textFieldMinValue.text!)!)
        }

        if textFieldMaxValue.text!.isEmpty { // проверяет значение в поле maxValue и выводит алерт
            
        let alertController = UIAlertController(title: "Внимание!", message: "Введите максимальное значение!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            
            } else {
                   maxValue = (Int(textFieldMaxValue.text!)!)
        }
        
       randomize()
       
       print(minValue, maxValue) // распечатываем в консоли минимальное и максимальное значение
        
    }
    
    
    @IBAction func btnClearLastTenNumber(_ sender: Any) {
        labelRandomize.text = "0"
        lastTenNumbersArray.removeAll()
        lblTenNumbers.text = "" 
        print(lastTenNumbersArray)
    }
    
    
    
}

