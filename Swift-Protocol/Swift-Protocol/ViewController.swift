//
//  ViewController.swift
//  Swift-Protocol
//
//  Created by Barrett Breshears on 10/11/14.
//  Copyright (c) 2014 Sledge Dev. All rights reserved.
//

import UIKit

// add our MyTimerDelegate to our class
class ViewController: UIViewController, MyTimerDelegate {
    
    var timer:MyTimer = MyTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer.view.frame = self.view.frame
        // ************************ \\
        // This is where we let the delegate know 
        // we are listening for the timerFinished method
        // ************************ \\
        timer.delegate = self
        self.view.addSubview(timer.view)
        timer.startTimer(10.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ************************ \\
    // This is where our delegate method is fired
    // ************************ \\
    func timerFinished(){
        timer.startTimer(10.0)
        println("Hey my delegate is working")
    }

}

