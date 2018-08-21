//
//  ViewController.swift
//  HelloDice
//
//  Created by Forrest Wallace on 8/21/18.
//  Copyright © 2018 Forrest Wallace. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sidesPicker: UIPickerView!
    
    var sides:Int = 6
    var result:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearResult()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func rollAction(_ sender: Any) {
        result = Int(arc4random_uniform(UInt32(sides))+1)
        refreshResult()
        
    }
    
    func refreshResult() {
        if result  == 0 {
            clearResult()
        }
        else{
            resultLabel.text = String(result)
        }
    }
    
    func clearResult()
    {
        resultLabel.text = "Click Roll"
    }
    
    //mark - picker delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch ( row ) {
            case 0:
                return "Six Sided"
            
            case 1:
                return "Twenty Sided"

            default:
                return "wtf?!?!"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch ( row ) {
            case 0:
                sides = 6
            
            case 1:
                sides = 20
            
            default:
                sides = 6
        }
        
        clearResult()
    }
}

