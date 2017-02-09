//
//  ViewController.swift
//  weather
//
//  Created by Loc Tran on 2/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    var quotes = ["hello hello hello", "hola hola hola", "bonjour bonjour bonjour"]
    
    var city = ["Hanoi","Saigon","Danang"]
    
    var background = ["Blood","Moon","Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomButton(_ sender: Any) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        
        quoteLabel.text = quotes[quoteIndex]
        
        let backgroundIndex = Int(arc4random_uniform(UInt32(background.count)))
        
        backgroundImage.image = UIImage.init(named: background[backgroundIndex])
        
        getTemp()
    }
    
    func getTemp() {
        let randomNumber = String(format: "%2.1f",tempRandom())
        tempLabel.text = randomNumber
    }
    
    
    func tempRandom() -> Double{
        if CFLabel.text == "C"{
            return Double(arc4random_uniform(18) + 14) +  Double(arc4random()) / Double(INT32_MAX)
        }else{
            return Double(arc4random_uniform(50) + 40) +  Double(arc4random()) / Double(INT32_MAX)
        }
        
    }
    
    func convertCtoF () {
        let tempF = Double(tempLabel.text!)! * 9 / 5 + 32
        tempLabel.text = String(format: "%2.1f", tempF)
    }
    
    func convertFtoC() {
        let tempC = (Double(tempLabel.text!)! - 32) * 5/9
        tempLabel.text = String(format: "%2.1f", tempC)
    }

    @IBOutlet weak var CFLabel: UILabel!
    
    
    @IBAction func convertTempButton(_ sender: Any) {
        if CFLabel.text == "C"{
            convertCtoF()
            CFLabel.text = "F"
        }else{
            convertFtoC()
            CFLabel.text = "C"
        }
    }
}

