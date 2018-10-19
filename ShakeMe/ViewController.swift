//
//  ViewController.swift
//  ShakeMe
//
//  Created by Dave on 12.10.2018.
//  Copyright © 2018 DaKar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startlabel: UIButton!
    
    var timer = Timer()
    
    var countInt = 20
    var scoreInt = 0
    var imageInt = 1
    var modeInt = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGameButton(_ sender: Any) {
        
        if countInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
            modeInt = 1
            
            startlabel.isEnabled = false
            startlabel.alpha = 0.25
        }
        if countInt == 0 {
            
            scoreInt = 0
            countInt = 20
            scoreLabel.text = String(scoreInt)
            timeLabel.text = String(countInt)
            startlabel.setTitle("Start Game", for: UIControlState.normal)
        }
    }
    @objc func startCounter() {
        countInt -= 1
        timeLabel.text = String(countInt)
        
        
        if countInt == 0 {
            timer.invalidate()
            modeInt = 0
            
            startlabel.isEnabled = true
            startlabel.alpha = 1
            startlabel.setTitle("Restart", for: UIControlState.normal)
            
            imageView.image = UIImage.init(named: "Maracas1")
        }
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if modeInt == 1 {
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                if imageInt == 5 {
                    imageInt = 1
                }
                
                imageView.image = UIImage.init(named: "Maracas\(imageInt)")
            }
        }
    }
}

