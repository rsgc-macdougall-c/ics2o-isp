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
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
       //lets add a background sprite
        let background = SKSpriteNode (imageNamed: "background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)//the background is now anchored in the middle of the screen
        background.size = self.frame.size //set the size to the size of the screen
        addChild(background)  //add the background sprite to the scene graph
        
        
        // adding a "Hero" sprite
        let Ninja = SKSpriteNode(imageNamed: "Ninja")
        
    }
}
    
