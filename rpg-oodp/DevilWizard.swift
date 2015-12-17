//
//  DevilWizard.swift
//  rpg-oodp
//
//  Created by Andrew Chng on 17/12/15.
//  Copyright © 2015 Andrew Chng. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {

    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}