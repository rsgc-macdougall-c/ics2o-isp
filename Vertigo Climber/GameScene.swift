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
    
    //side "wall" sprites for character to bounce off of
    let bambooShoot = SKSpriteNode(imageNamed: "bambooshoot-flipped")
    
    let bambooShootTwo = SKSpriteNode(imageNamed: "bambooshoot-two")
    
    //label and variable that tracks the score
    let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    var score = 1
    
    //label and variable that tracks the height
    let altitudeLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    var altitude = 0
    
    //this function runs immediately upon start-up
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
        
        // information for the two walls of bamboo
        bambooShoot.position = CGPoint(x: 163, y: size.height/2)
        bambooShoot.setScale(2)
        
        addChild(bambooShoot)
        
        bambooShootTwo.position = CGPoint(x: 1373, y: size.height/2)
        bambooShootTwo.setScale(2)
        addChild(bambooShootTwo)
        
        
        //periodically spawn obstacles
        let actionWait = SKAction.wait(forDuration: 2)
        
        let actionSpawn = SKAction.run() { [weak self] in self?.spawnObstacle()}
        
        let actionSequence = SKAction.sequence([actionWait, actionSpawn])
        
        let actionObstacleRepeat = SKAction.repeatForever(actionSequence)
        
        run(actionObstacleRepeat)
        
        //settings for the HUD score label
        scoreLabel.text = String(score)
        scoreLabel.fontColor = SKColor.black
        scoreLabel.fontSize = 96
        scoreLabel.zPosition = 150 // makes sure the HUD is above all other nodes on the screen
        scoreLabel.position = CGPoint(x: size.width - size.width/4, y: size.height - size.height/8)
        addChild(scoreLabel)
        
        //dictates the settings for the Altitude Label
        altitudeLabel.text = String(altitude)
        altitudeLabel.fontColor = SKColor.black
        altitudeLabel.fontSize = 96
        altitudeLabel.zPosition = 150 // makes sure the HUD is above all other nodes on the screen
        altitudeLabel.position = CGPoint(x: size.width - size.width/2, y: size.height - size.height/8)
        addChild(altitudeLabel)
        
        
        
        
        
        
    }
    
    //function that runs everytime SpriteKit updates the game frame
    override func update(_ currentTime: TimeInterval) {
        
        //checks for Collisions
        checkCollisions()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        handleTouch(touches, with: event)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        handleTouch(touches, with: event)
        
    }
    //function that controls touch events
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
        
        let leftDestination = CGPoint(x: 333, y: ninja.position.y)
        
        let rightDestination = CGPoint(x: self.size.width-333, y: ninja.position.y)
        
        // decide which side of the screen the tap occured on
        if ninja.position.x == leftDestination.x {
            // got to right side
            let actionMove = SKAction.move(to: rightDestination, duration: 0.33)
            
            //tell ninja to move
            ninja.run(actionMove)
            
        } else {
            
            let actionMove = SKAction.move(to: leftDestination, duration: 0.25)
            
            //tell ninja to move
            ninja.run(actionMove)
            
        }
        
    }
    
    // this function controls the "obstacles" and how they spawn
    func spawnObstacle() {
        
        let obstacle = SKSpriteNode(imageNamed: "shuriken")
        
        obstacle.setScale(0.25)
        //positioning of the obstacles
        let horizontalPosition = CGFloat(arc4random_uniform(UInt32(910)))
        
        let verticalPosition = size.height + obstacle.size.height
        
        //starting and ending positions
        let startingPosition = CGPoint(x: horizontalPosition + 300, y: verticalPosition)
        
        obstacle.position = startingPosition
        
        obstacle.name = "hadouken"
        
        addChild(obstacle)
        
        let endingPosition = CGPoint(x: horizontalPosition + 300, y: 0 - obstacle.size.height)
        //how long it takes before reaching the end of screen and removal
        let actionMove = SKAction.move(to: endingPosition, duration: 4)
        
        let actionRemove = SKAction.removeFromParent()
        
        let actionSequence = SKAction.sequence([actionMove, actionRemove])
        
        obstacle.run(actionSequence)
        
    }
    
    //checks for Collisions
    func checkCollisions() {
        
        //empty arry that will contain all the collisions
        var hitObstacles : [SKSpriteNode] = []
        //target specifically hadouken objects
        enumerateChildNodes(withName: "hadouken", using: {
            node, _ in
            
            let obstacle = node as! SKSpriteNode
            
            //detects for a collision between ninja and obstacle but also checks to see if ninja is still in fact present in the scene
            if obstacle.frame.insetBy(dx: 20, dy: 20).intersects(self.ninja.frame) && self.ninja.parent != nil {
                
                hitObstacles.append(obstacle)
            }
            
        })
        
        // iterate over the list of all the hadoukens that are intersecting with the hero and remove them
        for obstacle in hitObstacles {
            
            ninjaHit(by: obstacle)
        }
        
        
    }
    
    // This function removes the ninja from the scene
    func ninjaHit(by obstacle: SKSpriteNode) {
        
        score -= 1
        
        scoreLabel.text = String(score)
        
        ninja.removeFromParent()
        
        //check for game over
        if score == 0 {
            
            //create a game over scene the same size as the full screen
            let gameOverScene = GameOverScene(size: size)
            
            //configure a transition constant to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            
            //access the current view and present the new scene
            view?.presentScene(gameOverScene, transition: reveal)
            
            
        }
        
    }
    //function that increases difficulty over time by affecting durations and wait times
    func altitudeLabelChange() {
        
        altitude += 1
    }
    
    
    
    
}
