//
//  ParticlesSprites.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit
import SpriteKit

public class ParticlesSprites: SKScene {
    
    private var emitterNode: SKEmitterNode = SKEmitterNode() {
        didSet {
            emitterNode.position = CGPoint.zero
        }
    }
    
    private var loopAction: SKAction!
    
    public init(size: CGSize, emitterNode: SKEmitterNode) {
        self.emitterNode = emitterNode
        self.emitterNode.position = CGPoint(x: 10, y: 0)
        super.init(size: size)
        backgroundColor = UIColor.clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setEmitterNode(_ emitter: SKEmitterNode) {
        self.emitterNode = emitter
    }
    
    func startAnimating() {
        emitterNode.particleBirthRate = 40.0
        let particlesSpeed = (view?.superview as? AJParticlesLoadingView)?.particlesSpeed ?? 80.0
        emitterNode.particleSpeed = particlesSpeed
        emitterNode.targetNode = scene
        emitterNode.run(loopAction, withKey: "loop")
        if emitterNode.parent == nil {
            addChild(emitterNode)
        }
    }
    
    func stopAnimating() {
        emitterNode.particleBirthRate = 0
    }
    
    func isEmitting() -> Bool {
        return emitterNode.particleBirthRate != 0
    }
    
    func setAnimationPath() {
        var radii = CGSize.zero
        
        if let radius = view?.superview?.layer.cornerRadius {
            radii = CGSize(width: radius, height: radius)
        }
        
        let duration = (view?.superview as? AJParticlesLoadingView)?.duration ?? 2.0
        let particlesSize = (view?.superview as? AJParticlesLoadingView)?.particlesSize ?? 5.0

        if let scene = scene {
            
            let border = UIBezierPath(roundedRect: scene.frame, byRoundingCorners: .allCorners, cornerRadii: radii)
            let horizontalInsetScaleFactor: CGFloat = 1 - (particlesSize / scene.frame.size.width)
            let verticalInsetScaleFactor: CGFloat = 1 - (particlesSize / scene.frame.size.height)
            let horizontalTranslationFactor = 2 / (1 - horizontalInsetScaleFactor)
            let verticalTranslationFactor = 2 / (1 - verticalInsetScaleFactor)
            border.apply(CGAffineTransform(scaleX: horizontalInsetScaleFactor, y: verticalInsetScaleFactor))
            border.apply(CGAffineTransform(translationX: scene.frame.size.width / horizontalTranslationFactor, y: scene.frame.size.height / verticalTranslationFactor))
            
            var followLine = SKAction.follow(border.cgPath, asOffset: false, orientToPath: true, duration: duration)
            if let superview = view?.superview as? AJParticlesLoadingView {
                if superview.clockwiseRotation {
                    followLine = followLine.reversed()
                }
            }
            loopAction = SKAction.repeatForever(followLine)
        }
    }
}

        
