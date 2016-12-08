//
//  GameScene.swift
//  Vertigo Climber
//
//  Created by Connor MacDougall on 2016-11-24.
//  Copyright © 2016 MacDougall-CompSci. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // adding a "Hero" sprite
    let ninja = SKSpriteNode(imageNamed: "ninja")
    let bambooShoot = SKSpriteNode(imageNamed: "bamboo shoot")
    let bambooShootTwo = SKSpriteNode(imageNamed: "bamboo shoot two")
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black //adds the background sprite
        
        let background = SKSpriteNode (imageNamed: "bambooForest")
        
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        
        //the background is now anchored in the middle of the screen
        
        background.size = self.frame.size
        //sets the bambooBG size to the size of the screen
        
        background.zPosition = -1
        addChild(background)  //add the background sprite to the scene graph
        
        ninja.position = CGPoint(x: size.width/2, y: 300)
        
        // (0,0) is the bottom left of the screen
        
        addChild(ninja) //adds the ninja sprite to the scene
        
        bambooShoot.position = CGPoint(x: 263, y: size.height/2)
        
        addChild(bambooShoot)
        
        bambooShootTwo.position = CGPoint(x: 1273, y: size.height/2)
        
        addChild(bambooShootTwo)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //manage finger size on screen
        guard let touch = touches.first else {
            return
        }
        
        //get the location of the touch
        let touchLocation = touch.location(in: self)
       
        //Print the location to the console
        print(touchLocation.x)
        print(touchLocation.y)
        
        let destination = CGPoint(x: 450, y: ninja.position.y)
        
        let actionMove = SKAction.move(to: destination, duration: 0.33)
        
        //tell ninja to move
        ninja.run(actionMove)

        
    }
    
    
}
    
