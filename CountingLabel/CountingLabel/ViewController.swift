//
//  ViewController.swift
//  CountingLabel
//
//  Created by Origheart on 16/4/13.
//  Copyright © 2016年 Origheart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coutingLabel: CountingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        coutingLabel.countFrom(NSNumber(integer: 0), toNum: NSNumber(integer: 100), duration: 3.0)
    }


}

