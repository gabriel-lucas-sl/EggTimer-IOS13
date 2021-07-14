//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft" : 3, "Medium" : 4, "Hard" : 7 ]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        if let hardness = sender.currentTitle {
            totalTime = eggTimes[hardness]!
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            let porcentageProgress = Float(secondsPassed) / Float(totalTime)
            print(porcentageProgress)
            progressBar.progress = porcentageProgress
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    

}
