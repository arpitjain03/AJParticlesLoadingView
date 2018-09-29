//
//  ParticleType.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import Foundation

public enum ParticleEffect: String, CaseIterable {
    case fire = "Fire"
    case snow = "Snow"
    case rain = "Rain"
    case magic = "Magic"
    case bokeh = "Bokeh"
    case fireflies = "Fireflies"
    case spark = "Spark"
    case smoke = "Smoke"
    static func random() -> ParticleEffect {
        return ParticleEffect.allCases[
            Int(arc4random_uniform(UInt32(ParticleEffect.allCases.count)))]
    }
}

public enum ParticleImage: String, CaseIterable {
    case sunflower = "sunflower"
    case balloon = "balloons"
    case star = "star"
    case heart = "heart"
    case bokeh = "bokeh"
    case spark = "spark"
    case party = "party"
    static func random() -> ParticleImage {
        return ParticleImage.allCases[
            Int(arc4random_uniform(UInt32(ParticleImage.allCases.count)))]
    }

}
