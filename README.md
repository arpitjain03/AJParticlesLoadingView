# AJParticlesLoadingView

`AJParticlesLoadingView` is a simple subclass of UIView for creating amazing particles loading animation with using `Sprite Kit`. Our Xcode provides built-in [SpriteKit Particle File](http://help.apple.com/xcode/mac/current/#/dev9eed16018) which are being used to achieve different kinds of loading particles.  


![GIF1](https://media.giphy.com/media/xTcf1cCvsQs8ahUo6s/giphy.gif)![GIF2](https://media.giphy.com/media/3o7qiNeGt6Wcb31W5q/giphy.gif
)![GIF3](https://media.giphy.com/media/xUPJUKgv6mqT0mCEH6/giphy.gif)![GIF4](https://media.giphy.com/media/xTcf0ZhrrWWhHx2ICY/giphy.gif)![GIF5](https://media.giphy.com/media/3o7qiWgLkgqHaG7R16/giphy.gif)![GIF6](https://media.giphy.com/media/xTcf0XUC9IQrR0NiO4/giphy.gif)

## Requirements
iOS 8.0 and Swift 4.2 are required. 

## Installation
1. Just Drag and Drop AJParticlesLoadingView folder in your project.
2. By default we are using some images which are being loaded as particles.
3. For using your images as particle just add them in Sprites folder. Then add your image name in `Particle Image` enum which is in `Particle Type` file.

**NOTE:** For better result use image of atleast 128*128 dimension

## Usage
To see it in action clone the repo and run the sample project. It will show AJParticlesLoadingView is loaded.
For using it in your project :
1. Take a UIView from storyboard where you want to load particles.
2. Assign that UIView class of AJParticlesLoadingView.
3. Set the `particleImage` and `particleEffect`

```swift

var objParticlesLoadingView: AJParticlesLoadingView!  
objParticlesLoadingView.particleImage = .heart  // Particle Image
objParticlesLoadingView.particleEffect = .fire  // Particle Effect Type
```
4. Now for handling animation simply use:
```swift
objParticlesLoadingView.startAnimating()
objParticlesLoadingView.stopAnimating()
```

## Customizations

```swift
//For changing the particle image 
objAJParticlesLoadingView.particleImage = .heart  // you will get all added image here

//For changing the particle image 
objAJParticlesLoadingView.particleEffect = .fire  // you will get all added animations here

// Duration in seconds for completing the animation around the border of a view
objAJParticlesLoadingView.duration = 2.0
    
// The size of each particle images which are being used for loading particles
objAJParticlesLoadingView.particlesSize = 8.0

// The speed at which particles are being loaded inside a view
objAJParticlesLoadingView.particlesSpeed = 70.0
```

## License

`AJParticlesLoadingView` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Author
For any queries and suggestions reach out at arpit.cor@gmail.com

