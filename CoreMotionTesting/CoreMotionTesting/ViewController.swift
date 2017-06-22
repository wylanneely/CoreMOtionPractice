//
//  ViewController.swift
//  CoreMotionTesting
//
//  Created by ALIA M NEELY on 6/21/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let coreMotionController = CoreMotionController()
    
    
    @IBAction func getStepsButton(_ sender: Any) {
        coreMotionController.getPedometerData(pedometer: coreMotionController.pedometer)
    }
    @IBAction func logSteps(_ sender: Any) {
        coreMotionController.readPedometerData(perometerData: coreMotionController.pedometerData)
    }


}

