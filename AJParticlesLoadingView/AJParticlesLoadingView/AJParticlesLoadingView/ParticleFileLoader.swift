//
//  ParticleFileLoader.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit
import SpriteKit

public class ParticleFileLoader {
    
    public enum EmitterError: Error {
        case emitterNodeUnavailable
    }
    
    func createEmitterNode(with effect: ParticleEffect , particleImgName : String) throws -> SKEmitterNode {
        let bundle = Bundle(for: type(of: self))
        let path = Bundle.main.path(forResource: effect.rawValue, ofType: "sks")
        if let path = path , let emitter = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? SKEmitterNode, let textureImage = UIImage(named: particleImgName, in: bundle, compatibleWith: nil) {
            emitter.particleTexture = SKTexture(image: textureImage)
            return emitter
        } else {
            throw EmitterError.emitterNodeUnavailable
        }
    }
    
}

