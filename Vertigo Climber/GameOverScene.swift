//
//  GameOverScene.swift
//  Vertigo Climber
//
//  Created by Connor MacDougall on 2016-12-12.
//  Copyright © 2016 MacDougall-CompSci. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene : SKScene {
    
    //sets up label that asks the user wether they want to play again
    let playAgainLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    let gameOverLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        //sets up the label to state "Game Over"
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 288
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 150 //keeps label in foreground
        gameOverLabel.position = CGPoint(x: size.width/2, y: size.height/2) //very centre
        addChild(gameOverLabel)
     
        playAgainLabel.text = "Play Again?"
        playAgainLabel.fontSize = 270
        playAgainLabel.fontColor = SKColor.white
        playAgainLabel.zPosition = 150 //keeps label in foreground
        playAgainLabel.position = CGPoint(x: size.width/2, y: size.height/4) //slightly below centre
        addChild(playAgainLabel)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        handleTouch(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        handleTouch(touches, with: event)
        
    }
    //handles the touch event for the game over screen
    func handleTouch(_ touches: Set<UITouch>, with event: UIEvent?) {
        //manage finger size on screen
        guard let touch = touches.first else {
            return
        }
        
        //get the location of the touch
        let touchLocation = touch.location(in: self)
        
        //Print the location to the console
        print(touchLocation.x)
        print(touchLocation.y)
        
        //designates the playAgainLabel as the area to activate this teeny bit of code
        if playAgainLabel.frame.contains(touchLocation)    {
            
            //reset the game if tap occurs in correct location
            let gameScene = GameScene(size: size)
            
            //configure a transition constant to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            
            //access the current view and present the new scene
            view?.presentScene(gameScene, transition: reveal)
            
        } else {
            return
        }
    
    }
    
            
    }
