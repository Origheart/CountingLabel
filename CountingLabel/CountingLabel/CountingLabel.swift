//
//  CountingLabel.swift
//  CountingLabel
//
//  Created by Origheart on 16/4/13.
//  Copyright © 2016年 Origheart. All rights reserved.
//

import UIKit

class CountingLabel: UILabel {

    private var startTime: CFTimeInterval = 0
    private var start: NSNumber = NSNumber(integer: 0)
    private var end: NSNumber = NSNumber(integer: 0)
    private var _duration: Double = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    init() {
        super.init(frame: CGRectZero)
        
    }
    
    func countFrom(fromNum: NSNumber, toNum: NSNumber, duration: Double) -> Void {
        self.text = fromNum.stringValue
        start = fromNum
        end = toNum
        _duration = duration
        
        let link = CADisplayLink(target: self, selector: #selector(CountingLabel.animate(_:)))
        startTime = CACurrentMediaTime()
        link.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    func animate(link: CADisplayLink) {
        let dt = (link.timestamp - startTime) / _duration
        if dt > 1.0 {
            self.text = end.stringValue
            link.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
            return
        }
        
        let current = (end.doubleValue - start.doubleValue) * dt + start.doubleValue
        //self.text = "\(current)"
        self.text = NSString(format: "%.0f", current) as String
    }

}
