//
//  ViewController.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var objAJParticlesLoadingView: AJParticlesLoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* For creating animation you can use any particle image with any particle effect
         Few tested examples are : heart - bokeh , sunflower - magic , star - fire , party - snow , balloon - fireflies etc.
         */
        
        // Set the Particle Image
        objAJParticlesLoadingView.particleImage = .heart
        
        // Set the Particle Effect Type
        objAJParticlesLoadingView.particleEffect = .fireflies
        
        // Set the duration for completing the animation around the border of a view
        objAJParticlesLoadingView.duration = 2.0
        
        // Set the size of each particle images which are being used for loading particles
        objAJParticlesLoadingView.particlesSize = 8.0
        
        // Set clockwiseRotation enabled or disabled
        objAJParticlesLoadingView.clockwiseRotation = false
        
        // Set the speed at which particles are being loaded inside a view
        objAJParticlesLoadingView.particlesSpeed = 70.0
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // Set the Particle Image
            objAJParticlesLoadingView.particleImage = ParticleImage.random()
            // Set the Particle Effect Type
            while true {
                let particleEffect = ParticleEffect.random()
                if ((particleEffect != ParticleEffect.bokeh)
                    && (particleEffect != ParticleEffect.fire)
                    && (particleEffect != ParticleEffect.spark)) {
                    // NOTE: bokeh, fire, spark seem less impressive, so reject
                    // these until we get a different effect good for demo.
                    objAJParticlesLoadingView.particleEffect = particleEffect
                    break
                }
            }
            // Log choice to Xcode console.
            print(objAJParticlesLoadingView.particleImage.rawValue+" / "+objAJParticlesLoadingView.particleEffect.rawValue)
            // Start animating
            objAJParticlesLoadingView.startAnimating()
            sender.setTitle("STOP", for: UIControl.State())
            sender.layer.backgroundColor = UIColor.red.cgColor
        } else {
            objAJParticlesLoadingView.stopAnimating()
            sender.setTitle("START", for: UIControl.State())
            sender.layer.backgroundColor = UIColor.green.cgColor
        }
    }

}

