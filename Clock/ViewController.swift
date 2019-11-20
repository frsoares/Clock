//
//  ViewController.swift
//  Clock
//
//  Created by Francisco Soares on 10/08/18.
//  Copyright © 2018 Francisco Soares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel : UILabel!
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        
        self.timeLabel.text = df.string(from: Date())
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
        
            self.timeLabel.text = df.string(from: Date())
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
