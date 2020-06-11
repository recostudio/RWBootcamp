/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var targetTextLabel: UILabel!
  @IBOutlet weak var guessLabel: UILabel!
  
  @IBOutlet weak var redLabel: UILabel!
  @IBOutlet weak var greenLabel: UILabel!
  @IBOutlet weak var blueLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  var game = BullsEyeGame()
 var rgb = RGB()

    var targetColorValue = RGB()
    var guessColorValue = RGB()
    var score = 0
    var round = 0
  
  @IBAction func aSliderMoved(sender: UISlider) {
    redLabel.text = String(Int(redSlider.value))
    greenLabel.text = String(Int(greenSlider.value))
    blueLabel.text = String(Int(blueSlider.value))
    
    let guessColor = RGB(r: Int(redSlider.value), g: Int(greenSlider.value), b: Int(blueSlider.value))
    guessLabel.backgroundColor = UIColor(rgbStruct: guessColor)
    }
  
  @IBAction func showAlert(sender: AnyObject) {
    let difference = guessColorValue.difference(target: targetColorValue)
    
    var points = 100 - difference
      
    score += Int(points)
      
      let title: String
      if difference == 0 {
        title = "Perfect!"
        points += 100
      } else if difference < 5 {
        title = "You almost had it!"
          if difference == 1 {
          points += 50
        }
      } else if difference < 10 {
        title = "Pretty good!"
      } else {
        title = "Not even close..."
      }
      
      let message = "You scored \(Int(points)) points"
      
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      let action = UIAlertAction(title: "OK", style: .default, handler: {
        action in
        self.startNewRound()
        self.updateView()
      })
      
      alert.addAction(action)
      
      present(alert, animated: true, completion: nil)
      

  }
  
  @IBAction func startOver(sender: AnyObject) {
    startNewGame()
    updateView()
  }
  
  func updateView() {
    roundLabel.text = String(round)
    scoreLabel.text = String(score)
    
  }
  
  func startNewRound() {
//    game.startNewRound()
    round += 1
       targetColorValue = RGB(r: Int.random(in: 0...255), g: Int.random(in: 0...255), b: Int.random(in: 0...255))
    targetLabel.backgroundColor = UIColor(rgbStruct: targetColorValue)
    
    
    }
    func startNewGame() {
//        game.startNewGame()
        score = 0
        round = 0
        startNewRound()
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewGame()
  }
}

