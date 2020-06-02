//
//  ViewController.swift
//  Colorove
//
//  Created by Maciej Szostak on 6/1/20.
//  Copyright © 2020 Maciej Szostak. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var displayColorLabel: UILabel!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChange(_ sender: Any) {
        redLabel.text = String(Int(sliderRed.value))
        greenLabel.text = String(Int(sliderGreen.value))
        blueLabel.text = String(Int(sliderBlue.value))
        
        
        
    }
    
    
    @IBAction func showAlert() {
        let alert  = UIAlertController(title: "COLOROVE", message: "Name your color!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
   /*
        let action = UIAlertAction(title: "Show me!", style: .default) { (alertAction) in
            _ = alert.textFields![0] as UITextField
*/
            let action = UIAlertAction(title: "Show me!", style: .default, handler: { [weak self, weak alert] _ -> Void in
            if let textField = alert?.textFields?[0] {
                self?.displayColorLabel.text = textField.text
                self?.setcolor()
            }})
       
        
        
        
        
        
        /*
        let action2 = UIAlertAction(title: "Show me2", style: .default) { (action) in
            print("this is my action")
 */
      //  }
        
           alert.addTextField { (textField:UITextField!) ->  Void in textField.placeholder = "Color name"}
        
    
        alert.addAction(action)
   //     alert.addAction(action2)
        
        
        present(alert,animated: true, completion: nil)
      
        
        
    }
    
    
    func setcolor() {
        let red = CGFloat(sliderRed.value) / 255
        let green = CGFloat(sliderGreen.value) / 255
        let blue = CGFloat(sliderBlue.value) / 255
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        self.view.backgroundColor = bgColor
    }
    
    
    
    
}

