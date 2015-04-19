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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    @IBAction func stopTimer(sender: AnyObject) {
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
    }
}

