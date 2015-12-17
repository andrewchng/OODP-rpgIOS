//
//  ViewController.swift
//  rpg-oodp
//
//  Created by Andrew Chng on 17/12/15.
//  Copyright © 2015 Andrew Chng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    @IBOutlet weak var EnemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Fumo", hp: 120, attackPwr: 16)
        generateRandomEnemy()
        EnemyHpLbl.text = "\(enemy.hp) HP"
        playerHPLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12 )
        }
        else{
            enemy = DevilWizard(startingHP : 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }
    

    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func attackedTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) Dmg"
            EnemyHpLbl.text =  "\(enemy.hp) HP"
        }
        else {
            printLbl.text = "Attack was unsucessful!"
        }
        
        if let loot = enemy.dropLoot(){
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
            
        }
        
        if !enemy.isAlive {
            EnemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
}

