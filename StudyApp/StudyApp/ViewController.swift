//
//  ViewController.swift
//  StudyApp
//
//  Created by Christina Knight on 2/23/18.
//  Copyright © 2018 Christina Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Objects
    @IBOutlet weak var discolight: UIImageView!
    @IBOutlet weak var Cup1: UIImageView!
    @IBOutlet weak var EnterTitle: UILabel!
    @IBOutlet weak var EnterButton: UIButton!
    @IBOutlet weak var Cup2: UIImageView!
    let t = true
    override func viewDidLoad() {
        super.viewDidLoad()
        discolight.alpha = 0.7
        Cup1.transform = CGAffineTransform(rotationAngle: -0.34906585)
        Cup2.transform = CGAffineTransform(rotationAngle: 0.34906585)
        EnterButton.layer.cornerRadius = 4
//      Rotate(sender: Cup1)
        rotateViewFront(targetView: Cup1)
        rotateViewBack(targetView: Cup2)


        // Do any additional setup after loading the view, typically from a nib.
    }

    
    private func rotateViewFront(targetView: UIView, duration: Double = 1.0) {
        UIImageView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        }) { finished in
            self.rotateViewFront(targetView: targetView, duration: duration)
        }
    }
    
    private func rotateViewBack(targetView: UIView, duration: Double = 1.0) {
        UIImageView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: -3.1415926)
        }) { finished in
            self.rotateViewBack(targetView: targetView, duration: duration)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

