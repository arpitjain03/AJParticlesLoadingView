//
//  ViewController.swift
//  AJParticlesLoadingView
//
//  Created by Arpit Jain on 20/08/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var objParticlesLoadingView: AJParticlesLoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* For creating animation you can use any particle image with any particle effect 
         Few tested examples are : heart - bokeh , sunflower - magic , star - fire , party - snow , balloon - fireflies etc.
         */
        
        // Set the Particle Image
        objParticlesLoadingView.particleImage = .balloon
        
        // Set the Particle Effect Type
        objParticlesLoadingView.particleEffect = .fireflies
        
        // Set the duration for completing the animation around the border of a view
        objParticlesLoadingView.duration = 2.0
       
        // Set the size of each particle images which are being used for loading particles
        objParticlesLoadingView.particlesSize = 8.0
        
        // Set clockwiseRotation enabled or disabled
        objParticlesLoadingView.clockwiseRotation = false
      
        // Set the speed at which particles are being loaded inside a view
        objParticlesLoadingView.particlesSpeed = 70.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            objParticlesLoadingView.startAnimating()
            sender.setTitle("STOP", for: UIControlState())
        } else {
            objParticlesLoadingView.stopAnimating()
            sender.setTitle("START", for: UIControlState())
        }
    }

}

