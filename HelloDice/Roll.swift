//
//  Roll.swift
//  HelloDice
//
//  Created by Forrest Wallace on 8/21/18.
//  Copyright © 2018 Forrest Wallace. All rights reserved.
//

import Foundation

class Roll {
    var value :Int = 0
    var sides :Int = 0
    
    
    func makeRoll(inValue: Int, inSides: Int) -> Roll! {
        let roll = Roll()
        roll.value = inValue;
        roll.sides = inSides;
        
        return roll
    }
}
