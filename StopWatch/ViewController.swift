//
//  ViewController.swift
//  StopWatch
//
//  Created by Niket Patel on 10/30/14.
//  Copyright (c) 2014 Niket Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerDisplay: UILabel!
    var milliseconds: Int = 0
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    
    var timeCount = 0
    var isPlaying = false

    var timer = NSTimer()
    
    @IBAction func playPressed(sender: AnyObject) {
        if(isPlaying == false){
        timer = NSTimer.scheduledTimerWithTimeInterval(1/100, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        isPlaying = true
        }

    }
    
    @IBAction func pausePressed(sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
    }
    

    @IBAction func resetPressed(sender: AnyObject) {
        timer.invalidate()
        timeCount = 0
        timerDisplay.text = "00:00:00"
        isPlaying = false
    }
    
    func result() {
        timeCount++
        milliseconds = timeCount
        seconds = Int(timeCount/100)
        minutes = Int(seconds/60)
        hours = Int(minutes/60)
        
        var secondsDeduction = milliseconds - (seconds * 100)
        var minuteDeduction = seconds - (minutes * 60)
        var hourDeduction = minutes - (hours * 60)
        
        if seconds > 59 {
            if minutes > 59 {
                timerDisplay.text = "\(doubleDigitFormatter(hours)):\(doubleDigitFormatter(hourDeduction)):\(minuteDeduction):\(secondsDeduction)"
            }
            timerDisplay.text = "\(doubleDigitFormatter(minutes)):\(doubleDigitFormatter(minuteDeduction)):\(doubleDigitFormatter(secondsDeduction))"
        } else {
            timerDisplay.text = "\(doubleDigitFormatter(minutes)):\(doubleDigitFormatter(minuteDeduction)):\(doubleDigitFormatter(secondsDeduction))"
        }
    }
    
    
    func doubleDigitFormatter(input:Int) -> String {
        if input < 10 {
            return("0\(input)")
        } else {
            return("\(input)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

