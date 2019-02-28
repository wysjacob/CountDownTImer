//
//  ViewController.swift
//  TimerCountDown
//
//  Created by MAC on 3/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seconds = 30
    var add_time = 15
    var cnt = 0
    var timer = Timer()
    
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var timeExtension: UIButton!
    
    @IBOutlet weak var lblBasicTime: UILabel!
    @IBOutlet weak var lblAddTime: UILabel!
    
    @IBAction func slider1(_ sender: UISlider) {
        seconds = Int(sender.value)
        cnt = seconds
        lblTime.text = String(seconds)
        lblBasicTime.text = "basic time:"+String(seconds)
    }
    
    
    
    @IBAction func slider2(_ sender: UISlider) {
        add_time = Int(sender.value)
        lblAddTime.text = "additional time:"+String(add_time)
        
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        cnt = seconds
        lblTime.text = String(cnt)
        if !timer.isValid{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func btnExtension(_ sender: Any) {
        cnt += add_time
        lblTime.text = String(cnt)
    }
    
    @objc func counter() {
        cnt -= 1
        lblTime.text = String(cnt)
        
        if (cnt == 0) {
            timer.invalidate()
            Alert()
        }
    }
    
    
    func Alert() {
        let alertController = UIAlertController(title: "Time's Up", message: "A standard alert.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("cancel")
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true)
    }
    
}
