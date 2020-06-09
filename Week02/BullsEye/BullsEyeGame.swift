//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Maciej Szostak on 6/8/20.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

class BullsEyeGame {
   
     var currentValue = 0
     var targetValue = 0
     var score = 0
     var round = 0
    //computed property
    var difference :Int {abs(targetValue - currentValue)
    }
    func startNewRound() {
      round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      
    }
    
   func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    init() {
        startNewGame()
    }
    
    
    
    
}
