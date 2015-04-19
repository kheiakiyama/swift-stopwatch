//
//  ViewController.swift
//  StopwatchApp
//
//  Created by kohei akiyama on 2015/04/19.
//  Copyright (c) 2015年 kheiakiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: NSTimeInterval? = nil
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonEnabled(true, stop: false, reset: false)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setButtonEnabled(start: Bool, stop: Bool, reset: Bool) {
        self.startButton.enabled = start
        self.stopButton.enabled = stop
        self.resetButton.enabled = reset
    }
    
    func update() {
        if let t = self.startTime {
            let time: Double = NSDate.timeIntervalSinceReferenceDate() - t
            let sec: Int = Int(time)
            let msec: Int = Int((time - Double(sec)) * 100.0)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", sec/60, sec, msec)
        }
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        setButtonEnabled(true, stop: true, reset: false)
        self.startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    @IBAction func stopTimer(sender: AnyObject) {
        self.timer?.invalidate()
        self.timer = nil
        setButtonEnabled(true, stop: false, reset: true)
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        self.startTime = nil
        self.timerLabel.text = "00:00:00"
        setButtonEnabled(true, stop: false, reset: false)
    }
}

