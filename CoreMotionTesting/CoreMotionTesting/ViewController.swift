//
//  ViewController.swift
//  CoreMotionTesting
//
//  Created by ALIA M NEELY on 6/21/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var coreMotionController = CoreMotionController()
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var accelXLabel: UILabel!
    @IBOutlet weak var accelYLabel: UILabel!
    @IBOutlet weak var accelZLabel: UILabel!
    @IBOutlet weak var gyroXLabel: UILabel!
    @IBOutlet weak var gyroYLabel: UILabel!
    @IBOutlet weak var gyroZLabel: UILabel!
    @IBOutlet weak var accelXDescription: UILabel!
    @IBOutlet weak var accelYDescription: UILabel!
    @IBOutlet weak var accelZDescription: UILabel!
    
    @IBAction func startMotionButton(_ sender: Any) {
        coreMotionController.startMotionUpdates()
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
        coreMotionController.update()
        
        guard let acceleration = coreMotionController.acceleration else {print("acceleration was NIL");return}
        guard let gyroRotation = coreMotionController.gyroRotationRate else {print("gyro was NIL");return}
        
            mainView.backgroundColor? = .black
        
            updateLabelColorsToWhite()
            updateAccelerationLabels(acceleration: acceleration)
            updateGyroRotationLabels(gyroRotation: gyroRotation)
    }
    
    func updateLabelColorsToWhite(){
        accelXLabel.textColor = .white
        accelYLabel.textColor = .white
        accelZLabel.textColor = .white
        gyroXLabel.textColor = .white
        gyroYLabel.textColor = .white
        gyroZLabel.textColor = .white
        accelXDescription.textColor = .white
        accelYDescription.textColor = .white
        accelZDescription.textColor = .white
    }
    
    func updateLabelColorsToBlue(){
        accelXLabel.textColor = .blue
        accelYLabel.textColor = .blue
        accelZLabel.textColor = .blue
        gyroXLabel.textColor = .blue
        gyroYLabel.textColor = .blue
        gyroZLabel.textColor = .blue
        accelXDescription.textColor = .blue
        accelYDescription.textColor = .blue
        accelZDescription.textColor = .blue
    }
    //Acceleration is a vector quantity, i.e. it has magnitude and also direction in which it is occurring
    func updateAccelerationLabels(acceleration: CMAcceleration){
        let accelX = Double(round(10000 * acceleration.x)/10000)
        let accelY = Double(round(10000 * acceleration.y)/10000)
        let accelZ = Double(round(10000 * acceleration.z)/10000)
        accelXLabel.text = "\(accelX)"
        accelYLabel.text = "\(accelY)"
        accelZLabel.text = "\(accelZ)"
    }
    
    func updateGyroRotationLabels(gyroRotation: CMRotationRate){
        let gyroX = Double(round(10000 * gyroRotation.x)/10000)
        let gyroY = Double(round(10000 * gyroRotation.y)/10000)
        let gyroZ = Double(round(10000 * gyroRotation.z)/10000)
        gyroXLabel.text = "X: \(gyroX)"
        gyroYLabel.text = "Y: \(gyroY)"
        gyroZLabel.text = "Z: \(gyroZ)"
    }
    
}

