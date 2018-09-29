//
//  ParticleType.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import Foundation

public enum ParticleEffect: String {
    case fire = "Fire"
    case snow = "Snow"
    case rain = "Rain"
    case magic = "Magic"
    case bokeh = "Bokeh"
    case fireflies = "Fireflies"
    case spark = "Spark"
    case smoke = "Smoke"
    static func allEffects() -> [ParticleEffect] {
        return [.fire, .snow, .rain, .magic, .bokeh, .fireflies, .spark, .smoke]
    }
    static func random() -> ParticleEffect {
        var all = allEffects()
        return all[Int(arc4random_uniform(UInt32(all.count)))]
    }
}

public enum ParticleImage: String {
    case sunflower = "sunflower"
    case balloon = "balloons"
    case star = "star"
    case heart = "heart"
    case bokeh = "bokeh"
    case spark = "spark"
    case party = "party"
    static func allImages() -> [ParticleImage] {
        return [.sunflower, .balloon, .star, .heart, .bokeh, .spark, .party]
    }
    static func random() -> ParticleImage {
        var all = allImages()
        return all[Int(arc4random_uniform(UInt32(all.count)))]
    }

}
