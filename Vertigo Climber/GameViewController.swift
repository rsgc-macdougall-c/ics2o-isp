//
//  GameViewController.swift
//  Vertigo Climber
//
//  Created by Connor MacDougall on 2016-11-24.
//  Copyright © 2016 MacDougall-CompSci. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: CGSize(width: 1536, height: 2048))
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)

    }
    
    override var prefersStatusBarHidden: Bool {
        return true // status bar is now hidden
    }
    
}
