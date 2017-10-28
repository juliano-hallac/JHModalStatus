JHModalStatus is a Framework to show a customize modal status with an image, a headline and subhead text. The view is showed with a fade in animation. 

How to use?

#Add binaries
Import the project JHModalStatus in General of your project

#Import the framework
import JHModalStatus

#Call the follow code inside a UIViewController function binded in a button on screen

let modalView = JHModalStatusView(frame: self.view.bounds)
view.addSubview(modalView)
modalView.set(headLine: "Downloading...")


#Use  the follow code if you have a image in your project.
#let downloadImage = UIImage(named: "download") ?? UIImage()
#modalView.set(image: downloadImage)




