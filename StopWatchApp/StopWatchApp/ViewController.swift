//
//  ViewController.swift
//  StopWatchApp
//
//  Created by kohei akiyama on 2015/04/13.
//  Copyright (c) 2015年 kheiakiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: NSLayoutConstraint!
    
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

