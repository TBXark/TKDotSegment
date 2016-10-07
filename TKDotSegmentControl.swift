//
//  TKDotSegment.swift
//  TKDotSegment
//
//  Created by Tbxark on 16/4/11.
//  Copyright © 2016年 TBXark. All rights reserved.
//

import UIKit

/// 点击事件闭包
typealias TKDotSegmentAction = (_ index: Int,  _ internaliFlag: Bool) -> Void



class TKDotSegmentControl: UIView {
    /// 默认颜色
    static let defaultColor = UIColor(red:0.298,  green:0.741,  blue:0.404, alpha:1)
    /// 圆点(可自定义)
    class PLDot: UIView {
        var color: UIColor
        init(color: UIColor) {
            self.color = color
            super.init(frame: CGRect.zero)
            backgroundColor = UIColor.clear
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override func draw(_ rect: CGRect) {
            let oval = UIBezierPath(ovalIn: rect)
            color.setFill()
            oval.fill()
        }
    }
    
    /// 选项标题
    var titles: [String] {
        didSet {
            resetSegment()
        }
    }
    /// 圆点数量
    var numOfDot = 3 {
        didSet {
            resetSegment()
        }
    }
    /// 圆点直径
    var dotDiameter: CGFloat = 5 {
        didSet {
            changeDotFrameWithIndex(selectIndex, animate: false, toRight: false)
        }
    }
    /// 圆点间距,当小于0时为自定义
    var dotSpace: CGFloat = -1 {
        didSet {
            changeDotFrameWithIndex(selectIndex, animate: false, toRight: false)
        }
    }
    /// 圆点颜色
    var dotColor = TKDotSegmentControl.defaultColor {
        didSet {
            for dot in dotArray {
                dot.color = dotColor
            }
        }
    }
    /// 选中时的颜色
    var selectTitleColor: UIColor? = TKDotSegmentControl.defaultColor {
        didSet {
            for btn in titleButtonArray {
                btn.setTitleColor(selectTitleColor, for: .disabled)
            }
        }
    }
    /// 未选中时的颜色
    var unSelectTitleColor: UIColor? = UIColor.darkGray {
        didSet {
            for btn in titleButtonArray {
                btn.setTitleColor(selectTitleColor, for: UIControlState())
            }
        }
    }
    /// 字体
    var titleFont: UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            for btn in titleButtonArray {
                btn.titleLabel?.font = titleFont
            }
        }
    }
    /// 点击事件
    var clickAction: TKDotSegmentAction?

    
    
    override var frame: CGRect {
        didSet {
            if oldValue.size != frame.size {
                resetSegment()
            }
        }
    }
    
    
    /// 被选中的 Index
    fileprivate(set) var selectIndex: Int = -1
    fileprivate var titleButtonArray = [UIButton]()
    fileprivate var dotArray = [PLDot]()
    
    init(titles: [String], frame: CGRect) {
        self.titles = titles
        super.init(frame: frame)
        shareInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        titles = []
        super.init(coder: aDecoder)
        shareInit()
    }
    
    
    
    fileprivate func shareInit() {
        guard titles.count > 0 else { return }
        isUserInteractionEnabled = true
        func makeButtonByName(_ name: String) -> UIButton {
            let button = UIButton(type: .custom)
            button.setTitle(name, for: UIControlState())
            button.setTitleColor(unSelectTitleColor, for: UIControlState())
            button.setTitleColor(selectTitleColor, for: .disabled)
            button.titleLabel?.font = titleFont
            button.addTarget(self, action: #selector(TKDotSegmentControl.titleButtonClick(_:)), for: .touchUpInside)
            return button
        }
        
        let width: CGFloat = frame.width/CGFloat(titles.count)
        let height = bounds.height
        var buttonFrame = CGRect(x: 0, y: 0, width: width, height: height)
        var titleButtonArrayTemp = [UIButton]()
        for (i, btnTitle) in titles.enumerated() {
            buttonFrame.origin.x = width * CGFloat(i)
            let button = makeButtonByName(btnTitle)
            button.frame = buttonFrame
            button.tag = i
            titleButtonArrayTemp.append(button)
            addSubview(button)
        }
        var dotArrayTemp = [PLDot]()
        for i in 0..<numOfDot {
            let dot = PLDot(color: dotColor)
            dot.tag = i
            dotArrayTemp.append(dot)
            addSubview(dot)
        }
        dotArray = dotArrayTemp
        titleButtonArray = titleButtonArrayTemp
        changeSelectedIndex(0, internaliFlag: false, animate: false)
    }
    
    
    fileprivate func resetSegment() {
        subviews.forEach { $0.removeFromSuperview() }
        dotArray = []
        titleButtonArray = []
        selectIndex = -1
        if titles.count > 0 {
            shareInit()
        }
    }
}


extension TKDotSegmentControl {
    
    
    @objc fileprivate func titleButtonClick(_ button: UIButton) {
        changeSelectedIndex(button.tag, internaliFlag: true)
        
    }
    
    func changeSelectedIndex(_ index: Int, animate: Bool = true) {
        changeSelectedIndex(index, internaliFlag: false, animate: true)
    }
    
    
    /**
     发生点击事件时触发(私有)
     
     - parameter index:         被选中的 index
     - parameter internaliFlag: 是否内部点击触发的标志位
     - parameter animate:       是否需要动画效果
     */
    fileprivate func changeSelectedIndex(_ index: Int, internaliFlag: Bool, animate: Bool = true) {
        if selectIndex >= 0 {titleButtonArray[selectIndex].isEnabled = true }
        let flag = index > selectIndex
        guard index >= 0 && index < titles.count else { return }
        titleButtonArray[index].isEnabled = false
        selectIndex = index
        self.clickAction?(index, internaliFlag)
        changeDotFrameWithIndex(selectIndex, animate: animate, toRight: flag)
    }
    
    fileprivate func changeDotFrameWithIndex(_ index: Int, animate: Bool, toRight: Bool) {
        let rect = titleButtonArray[index].frame
        let num = CGFloat(numOfDot)
        var s = dotSpace
        if s < 0 { s = (rect.width - dotDiameter * num) / (num + 1) }
        let y = rect.origin.y + rect.height - dotDiameter - 2
        let w = num * dotDiameter
        let beginSpace = (rect.width - w - ((num + 1) * s))/2.0
        let originx = rect.origin.x + beginSpace
        var bRect = CGRect(x: s, y: y, width: dotDiameter, height: dotDiameter)
        
        for i in 0..<numOfDot {
            let index = toRight ? (numOfDot - 1 - i) : i
            let dot = dotArray[index]
            bRect.origin.x = s * CGFloat(index + 1) + dotDiameter * CGFloat(index) + originx
            if animate {
                UIView.animate(withDuration: 0.2, delay: Double(i) * 0.1, options: .curveLinear, animations: {
                    dot.frame = bRect
                    }, completion: nil)
            } else {
                dot.frame = bRect
            }
        }
    }
}
