//
//  ViewController.swift
//  TKDotSegment
//
//  Created by Tbxark on 16/4/11.
//  Copyright © 2016年 TBXark. All rights reserved.
//

import UIKit
import TKDotSegment

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titles = ["First", "Second", "Third", "Fourth"]
        let  segment = TKDotSegmentControl(titles: titles, frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        segment.dotColor = UIColor(red:1,  green:0.539,  blue:0.490, alpha:1)
        segment.selectTitleColor = UIColor(red:1,  green:0.539,  blue:0.490, alpha:1)
        segment.numOfDot = 4
        segment.dotSpace = 6
        segment.clickAction = { (index: Int, changeOffset: Bool) in
            print("Segment Select Index: \(index)")
        }
        view.addSubview(segment)
        segment.center = view.center
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

