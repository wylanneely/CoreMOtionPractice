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
    
    func startMotionUpdates(){
        motionManager.accelerometerUpdateInterval = CCDirector.sharedDirector().animationInterval
        motionManager.startAccelerometerUpdates()
        motionManager.gyroUpdateInterval = CCDirector.sharedDirector().animationInterval
        motionManager.startGyroUpdates()
        
        
    }
    
    func getPedometerData( pedometer: CMPedometer){
        
        pedometer.queryPedometerData(from: Date(), to: Date.init(timeInterval: 2.00, since: Date())) { (data, error) in
            if let error = error {
                NSLog("Error while querying data: \(error.localizedDescription)")
            }
           self.pedometerData = data
        }
    }
    
   func readPedometerData(perometerData: CMPedometerData?){
    guard let perometerData = perometerData else {return}
        
        
        guard let averagePace = perometerData.averageActivePace as? NSInteger else { return}
        
        print("\(averagePace)")
        
        
    }
    
    
    
    
}
