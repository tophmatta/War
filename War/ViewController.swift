//
//  ViewController.swift
//  War
//
//  Created by Toph on 7/6/15.
//  Copyright (c) 2015 Toph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var enemyScore: UILabel!
    
    // Timer properties
    var timer:NSTimer!
    var countdown:Int = 10
    @IBOutlet weak var countdownLabel: UILabel!
    
    var cardNamesArray:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    
    var playerScoreTotal:Int = 0
    var enemyScoreTotal:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start the timer
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerUpdate"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timerUpdate(){
        // Decrement Counter
        countdown--
        
        // Initialize countdown label
        self.countdownLabel.text = String(countdown)
        
        if(countdown == 0) {
            
            // Stop the timer
            self.timer.invalidate()
            self.playRoundButton.enabled = false
            
            var alertText:String = ""
            if (playerScoreTotal > enemyScoreTotal) {
                
                // Win
                alertText = "You Win!"
            }
            else if(playerScoreTotal < enemyScoreTotal) {
                
                // Lose
                alertText = "You Lose! Waaaaaahhhh"
                
            }
            else {
                // Tie
                alertText = "Lame, it's a tie"
            }
            
            var alert:UIAlertController = UIAlertController(title: "Time's Up", message: alertText, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func playRoundTapped(sender: UIButton) {
        
        // Randomize a # for the first imageview
        var firstRandomNumber:Int = Int(arc4random_uniform(13))
        
        //Construct a string for the random number
        var firstCardString:String = self.cardNamesArray[firstRandomNumber]
        
        // Set the first card imageview to the asset corresponding to the randomized number
        self.firstCardImageView.image = UIImage(named: firstCardString)
        
    
        // Randomize a number for the second interview
        var secondRandomNumber:Int = Int(arc4random_uniform(13))
        
        // Construct a string with the random number
        var secondCardString:String = self.cardNamesArray[secondRandomNumber]
        
        // Set the second card imageview to the asset corresponding to the randomized number
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        
        // Determine the higher card
        if firstRandomNumber > secondRandomNumber {
            // to do: first card is higher
            playerScoreTotal += 1
            self.playerScore.text = String(playerScoreTotal)
        }
        else if firstRandomNumber == secondRandomNumber {
            // to do: tied values
        }
        else {
            enemyScoreTotal += 1
            self.enemyScore.text = String(enemyScoreTotal)
        }
    }
}

