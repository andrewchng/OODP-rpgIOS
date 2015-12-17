//
//  Kimara.swift
//  rpg-oodp
//
//  Created by Andrew Chng on 17/12/15.
//  Copyright © 2015 Andrew Chng. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String]  {
        return ["Tough Hide", "Kimara Vemon", "Rare Trident"]
        
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX{
            return super.attemptAttack(attackPwr)
        }
        else{
            return false
        }
    }
}