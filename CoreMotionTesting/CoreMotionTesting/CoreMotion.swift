//
//  CoreMotion.swift
//  CoreMotionTesting
//
//  Created by ALIA M NEELY on 6/21/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import CoreMotion

class CoreMotionController {
    
    var motionManager = CMMotionManager()
    let pedometer = CMPedometer()
    
    var pedometerData: CMPedometerData?
    var gyroRotationRate: CMRotationRate?
    var acceleration: CMAcceleration?
    
    func startMotionUpdates() {
        motionManager.accelerometerUpdateInterval = 1.0
        motionManager.startAccelerometerUpdates()
        motionManager.gyroUpdateInterval = 1.0
        motionManager.startGyroUpdates()
    }
     func update() {
        
        guard let accelData = motionManager.accelerometerData else {print("accelData was nil"); return}
        guard let gyroData = motionManager.gyroData else {print("gyroData was nil") ;return}
        let rotationRate = gyroData.rotationRate
        let acceleration = accelData.acceleration
        self.acceleration = acceleration
        self.gyroRotationRate = rotationRate
        
        NSLog("accel x: %f, y: %f, z: %f", acceleration.x, acceleration.y, acceleration.z)
        NSLog("gyro x: %f, y: %f, z: %f", rotationRate.x, rotationRate.y, rotationRate.z)
    }
    
    
}
