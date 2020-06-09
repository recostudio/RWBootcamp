//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Maciej Szostak on 6/8/20.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

class BullsEyeGame {
   
   var targetColorValue = RGB()
     var guessColorValue = RGB()
     var score = 0
     var round = 0

    /*
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
    */
    func startNewRound() {
        round += 1
    targetColorValue = RGB(r: Int.random(in: 0...255), g: Int.random(in: 0...255), b: Int.random(in: 0...255))
        
    }
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        
    }
    
}
