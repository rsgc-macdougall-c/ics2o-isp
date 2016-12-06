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
        
    }
}
    
