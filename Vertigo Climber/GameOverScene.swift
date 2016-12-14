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
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        //sets up the label to state "Game Over"
        let gameOverLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 288
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 150 //keeps label in foreground
        gameOverLabel.position = CGPoint(x: size.width/2, y: size.height/2) //very centre
        addChild(gameOverLabel)
      
        let playAgainLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        playAgainLabel.text = "Play Again?"
        playAgainLabel.fontSize = 270
        playAgainLabel.fontColor = SKColor.white
        playAgainLabel.zPosition = 150 //keeps label in foreground
        playAgainLabel.position = CGPoint(x: size.width/2, y: size.height/4) //slightly below centre
        addChild(playAgainLabel)
        
    }
    
    
            
    }
