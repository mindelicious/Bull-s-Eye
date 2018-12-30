//
//  ViewController.swift
//  BulllEye
//
//  Created by Matt on 18/11/2018.
//  Copyright © 2018 mindelicious. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var currentValue = 0
    var randomNumber = 0
    var updateScore = 0
    var updateRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        restartGame()
     
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHiglighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHiglighted, for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: inset)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
     
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: inset)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    
    @IBAction func showAlert(_ sender: Any) {
        compareNumbers()
        updateNumbers()

    }
    
    @IBAction func startOver(_ sender: Any) {
        
        restartGame()
        
    }
    
    @IBAction func sliderValue(_ slider: UISlider) {
       
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    func restartGame() {
        
        scoreLabel.text = String(0)
        updateRound = 1
        updateNumbers()
        
        
    }
    
    func compareNumbers() {
        
        let compareNumbers = abs(currentValue - randomNumber)
      
        switch compareNumbers {
        case 0 :
            let alert = UIAlertController(title: "Bulls Eye", message: "You hit: \(currentValue).\n That's 250 points.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: {
                action in
                self.updateScore = self.updateScore + 250
                self.scoreLabel.text = String(self.updateScore)
                self.updateRound += 1
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
          
            
        case 1...5 :
            
            let alert = UIAlertController(title: "Perfect", message: "You hit: \(currentValue).\n That's 200 points.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: {
                action in
                self.updateScore = self.updateScore + 200
                self.scoreLabel.text = String(self.updateScore)
                self.updateRound += 1
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            
        case 6...10 :
            
            let alert = UIAlertController(title: "Nice Shot", message: "You hit: \(currentValue).\n That's 100 points.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: {
                action in
                self.updateScore = self.updateScore + 100
                self.scoreLabel.text = String(self.updateScore)
                self.updateRound += 1
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            
    
        case 11...20 :
            
            let alert = UIAlertController(title: "Aim better next time", message: "You hit: \(currentValue).\n That's 50 points.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: {
                action in
                self.updateScore = self.updateScore + 50
                self.scoreLabel.text = String(self.updateScore)
                self.updateRound += 1
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
       
            
        default:
            
            let alert = UIAlertController(title: "Are You drunk:)?", message: "You hit: \(currentValue).\n That's 10 points.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: {
                action in
                self.updateScore = self.updateScore + 10
                self.scoreLabel.text = String(self.updateScore)
                self.updateRound += 1
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
    
        }
      
     
    }
    
    func updateNumbers() {
        
        randomNumber = Int.random(in: 1...100)
        targetLabel.text = String(randomNumber)
        
        roundLabel.text = String(updateRound)
    }
}
