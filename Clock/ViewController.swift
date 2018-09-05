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

    // MARK: Examples of button pressing functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
        print(touches.first?.force ?? 0.0)
        super.touchesBegan(touches, with: event)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses began")
        print(presses.first?.force ?? 0.0)
        
        
        for press in presses {
            let toPrint : String
            switch press.type {
            case .playPause:
                toPrint = "pressed play"
            case .select:
                toPrint = "pressed select"
            case .upArrow:
                toPrint = "pressed up"
            default:
                toPrint = "another button pressed"
            }
            print(toPrint)
        }
        
        super.pressesBegan(presses, with: event)
    }
    
    override func pressesChanged(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses changed")
        print(presses.first?.force ?? 0.0)
        super.pressesChanged(presses, with: event)
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses ended")
        super.pressesEnded(presses, with: event)
    }
    
    // pressesCancelled is usually called when a gesture is identified by a gestureRecognizer, thus turning low-level button press recognition useless.
    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses cancelled")
        super.pressesCancelled(presses, with: event)
    }
    

}
