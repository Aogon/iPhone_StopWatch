//
//  ViewController.swift
//  StopWatch
//
//  Created by Sakai Aoi on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var perfectLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        perfectLabel.isHidden = true
    }
    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector:#selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
        }
        self.hantei()
    }
    
    @IBAction func reset(){
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
        perfectLabel.isHidden = true
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
        perfectLabel.isHidden = true
    }
    
    @objc func hantei(){
        perfectLabel.isHidden = false
        if 9.80 <= count && count <= 10.20 {
            perfectLabel.text = "Perfect!!"
        }else if 9.70 <= count && count <= 10.30 {
            perfectLabel.text = "Great"
        }else if 9.50 <= count && count <= 10.50 {
            perfectLabel.text = "Good"
        }else{
            perfectLabel.text = "Bad"
        }
    }
    


}

