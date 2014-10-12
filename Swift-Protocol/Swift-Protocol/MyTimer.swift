//
//  MyTimer.swift
//  SwiftProtocol
//
//  Created by Barrett Breshears on 10/11/14.
//  Copyright (c) 2014 Sledge Dev. All rights reserved.
//

import UIKit

// set up the MyTimerDelegate protocol with a single option timer finished function
@objc protocol MyTimerDelegate{
    optional func timerFinished()
}


class MyTimer: UIViewController {
    
    // this is where we declare our protocol
    var delegate:MyTimerDelegate?
    
    // set up timer variables and labels
    var timer:NSTimer! = NSTimer()
    var labelTimer:NSTimer! = NSTimer()
    var timerLabel:UILabel! = UILabel()
    var timerCount = 0
    var duration = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        timerLabel = UILabel(frame: self.view.frame)
        timerLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(timerLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer(timerDuration:Double){
        self.duration = Int(timerDuration)
        timerLabel.text = String(format: "%d", duration)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timerDuration, target: self, selector: Selector("timerFired:"), userInfo: nil, repeats: false)
        
        labelTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateLabel:"), userInfo: nil, repeats: true)
        
        
    }
    
    func timerFired(timer:NSTimer){
        if(timer.valid){
            timer.invalidate()
        }
        if(labelTimer.valid){
            labelTimer.invalidate()
        }
        // ************************************** \\
        // ************************************** \\
        // This is the important part right here
        // we want to call our protocol method here
        // so the class implementing this delegate will know
        // when the timer has finished
        // ************************************** \\
        // ************************************** \\
        delegate?.timerFinished!()
        
    }
    
    func updateLabel(timer:NSTimer){
        duration = duration - 1
        timerLabel.text = String(format: "%d", duration)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
