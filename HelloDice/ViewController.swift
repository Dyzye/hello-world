//
//  ViewController.swift
//  HelloDice
//
//  Created by Forrest Wallace on 8/21/18.
//  Copyright © 2018 Forrest Wallace. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

   

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sidesPicker: UIPickerView!
    @IBOutlet weak var rollsTable: UITableView!
    
    var sides:Int = 6
    var result:Int=0
    var previousrolls: Array <Roll> = Array()
    
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
        addRoll(value: result)
        refreshResult()
        
    }
    
    @IBAction func clearTable(_ sender: Any) {
        clearRolls()
        clearResult()
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
    
    func clearRolls()
    {
        previousrolls = Array()
        refreshRollsTable()
    }
    func addRoll(value: Int)
    {
        previousrolls.append(Roll.makeRoll(value: value, sides: sides))
        refreshRollsTable();
    }
    
    func refreshRollsTable()
    {
        rollsTable.reloadData()
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
    
// Mark - table Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previousrolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let label = cell.textLabel {
            let roll = previousrolls[indexPath.row]
            label.text = String(roll.value) + "     \(roll.sides) sides" // add date
        }
    }
    
    
}

