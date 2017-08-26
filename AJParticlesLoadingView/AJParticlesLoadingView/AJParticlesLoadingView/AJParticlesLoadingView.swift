//
//  AJParticlesLoadingView.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit
import SpriteKit

class AJParticlesLoadingView: UIView {
    
        // MARK: - Public Properties
        // MARK: -

        public var duration = 2.0
        public var particlesSize: CGFloat = 5.0
        public var particlesSpeed : CGFloat = 80.0
        public var clockwiseRotation: Bool = false
        public var particleImage = ParticleImage.spark
    
        public var emitterNode: SKEmitterNode? = nil {
            didSet {
                if let emitter = emitterNode {
                    scene.setEmitterNode(emitter)
                }
            }
        }
    
        public var particleEffect = ParticleEffect.snow {
            didSet {
                if let _ = scene {
                    do {
                        let emitter = try particleFileLoad.createEmitterNode(with: particleEffect, particleImgName: particleImage.rawValue)
                        scene.setEmitterNode(emitter)
                    } catch {
                        print("Could not find the particles file")
                    }
                } else {
                    setAJParticlesLoadingView()
                }
            }
        }
    
        // MARK: - Private Properties
        // MARK: -

        private let particleFileLoad = ParticleFileLoader()
        private var spriteKitView = SKView()
        private var scene: ParticlesSprites!

        // MARK: - Initialization
        // MARK: -
    
        override public init(frame: CGRect) {
            super.init(frame: frame)
            spriteKitView = SKView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            spriteKitView.backgroundColor = UIColor.clear
            setAJParticlesLoadingView()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            spriteKitView = SKView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            spriteKitView.backgroundColor = UIColor.clear
            setAJParticlesLoadingView()
        }
        
        func setAJParticlesLoadingView() {
            do {
                let emitter = try particleFileLoad.createEmitterNode(with: particleEffect, particleImgName:particleImage.rawValue)
                scene = ParticlesSprites(size: frame.size, emitterNode: emitter)
                spriteKitView.presentScene(scene)
                addSubview(spriteKitView)
            } catch {
                print("Could not find the particles file")
            }
        }
        
        public override func startAnimating() {
            scene.startAnimating()
        }
        
        public override func stopAnimating() {
            scene.stopAnimating()
        }
        
        public override func isEmitting() -> Bool {
            return scene.isEmitting()
        }
        
        public override func willMove(toSuperview newSuperview: UIView?) {
            scene.setAnimationPath()
        }
    
}

public extension UIView {
    
    public func addParticlesAnimation(with emitter: SKEmitterNode? = nil, effect: ParticleEffect? = nil , imgName : String? = nil) {
        
        var spriteKitView = SKView()
        spriteKitView = SKView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        spriteKitView.backgroundColor = UIColor.clear
        
        var scene: ParticlesSprites
        if let emitter = emitter {
            scene = ParticlesSprites(size: frame.size, emitterNode: emitter)
        } else if let effect = effect {
            do {
                let emitter = try ParticleFileLoader().createEmitterNode(with: effect, particleImgName:"")
                scene = ParticlesSprites(size: frame.size, emitterNode: emitter)
            } catch {
                fatalError("ParticleEffect could not be loaded.")
            }
        } else {
            fatalError("No SKEmitterNode found.")
        }
        
        if let backgroundColor = backgroundColor {
            scene.backgroundColor = backgroundColor
        }
        spriteKitView.presentScene(scene)
        addSubview(spriteKitView)
        scene.setAnimationPath()
    }
    
    public func startAnimating() {
        for case let spriteKitView as SKView in subviews {
            if let scene = spriteKitView.scene, let ParticlesSprites = scene as? ParticlesSprites {
                ParticlesSprites.startAnimating()
            }
        }
    }
    
    public func stopAnimating() {
        for case let spriteKitView as SKView in subviews {
            if let scene = spriteKitView.scene, let ParticlesSprites = scene as? ParticlesSprites {
                ParticlesSprites.stopAnimating()
            }
        }
    }
    
    public func isEmitting() -> Bool {
        for case let spriteKitView as SKView in subviews {
            if let scene = spriteKitView.scene, let ParticlesSprites = scene as? ParticlesSprites {
                return ParticlesSprites.isEmitting()
            }
        }
        return false
    }
}
