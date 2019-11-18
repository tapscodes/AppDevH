//
//  TitleScene.swift
//  PongPS
//
//  Created by Tristan Pudell-Spatscheck on 11/18/19.
//  Copyright © 2019 Tristan Pudell-Spatscheck. All rights reserved.
//

import Foundation
import GameplayKit
var score1 = 0 //player score
var score2 = 0 //enemy score
class TitleScene:SKScene{
    var scoreText = SKLabelNode()
    override func didMove(to view: SKView) {
        scoreText = self.childNode(withName: "resultLbl") as! SKLabelNode
        if(score1 == 9){
            scoreText.text = "Congrats, You won 10 to \(score2)!"
        } else if(score2 == 9){
            scoreText.text = "Darn, You lost 10 to \(score1)!"
        } else {
            scoreText.text = ""
        }
    }
    //starts game when screen is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = SKScene(fileNamed: "GameScene") 
        // Set the scale mode to scale to fit the window
        scene!.scaleMode = .aspectFill
        // Present the scene
        view!.presentScene(scene)
        }
}
