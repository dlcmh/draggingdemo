//
//  ViewController.swift
//  DraggingDemo
//
//  Created by David Chin on 29/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dragMeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(didDrag(_:)))
        dragMeLabel.addGestureRecognizer(gesture)
        dragMeLabel.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didDrag(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        
        // type CGRect - for construction of guard (A)
        var potentialTargetFrame = dragMeLabel.frame
        potentialTargetFrame.origin.x += translation.x
        potentialTargetFrame.origin.y += translation.y
        
        // (A) guards against dragMeLabel going off-screen
        if self.view.frame.contains(potentialTargetFrame) {
            dragMeLabel.frame = potentialTargetFrame
            gesture.setTranslation(CGPoint(x:0, y:0), in: self.view)
        }
    }


}

