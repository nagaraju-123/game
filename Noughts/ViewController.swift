//
//  ViewController.swift
//  Noughts
//
//  Created by praveen velanati on 2/21/16.
//  Copyright © 2016 praveen velanati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameOverLabel: UILabel!
    var activePlayer = 1 // 1 = noughts, 2 = crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
     var gameActive = true
    @IBOutlet weak var button: UIButton!
    
    @IBAction func playAgain(sender: UIButton) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        gameActive = true
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        
        var buttonToClear: UIButton
        
        for var i = 0 ; i < 9 ; i++ {
         
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    func endGame(){
        
        gameOverLabel.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
            
        })

        
        
    }
    
    
  
    @IBAction func buttonPressed(sender: UIButton) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
      
            gameState[sender.tag] = activePlayer
       
            if activePlayer == 1 {
            
                sender.setImage(UIImage(named: "nought"), forState: .Normal)
           
                activePlayer = 2
            
        } else {
            sender.setImage(UIImage(named: "cross"), forState: .Normal)
            activePlayer = 1
        }
        
            for combination in winningCombinations {

if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] &&
                gameState[combination[1]] == gameState[combination[2]]) {
                
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "noughts have won"
                    }
                    else
                    {
                        
                        gameOverLabel.text = "cross have won"
                    }
                
                    
                    endGame()
                    
                   }
                
}
            
            if gameActive == true {
            
                gameActive = false
            
                for buttonstate in gameState {
                    
                    if buttonstate == 0 {
                        gameActive = true
                    }
                    
                    
                    
                }
                if gameActive == false {
                    
                    gameOverLabel.text = "it's a draw"
                    endGame()
                    
                }
                
                
            }
            
            
            
            
            }
        
        
    }

}

