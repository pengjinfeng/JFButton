//
//  JFButton.swift
//  SWTYC
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 pengjf. All rights reserved.
//

import UIKit

enum JFAlignmentStatus {
    case Left//  图标在左
    case Right// 图标在上右
    case Top//   图标在上，文本在下
    case Bottom// 图标在下文本在上
}

class JFButton: UIButton {
    
    
    //外界通过设置status设置显示的样式
    var status:JFAlignmentStatus = JFAlignmentStatus.Left
    var spaces:CGFloat = 0.0
    
    //初始化方法
    init(frame: CGRect,status:JFAlignmentStatus = .Left,space:CGFloat = 0.0) {
        super.init(frame: frame)
        self.status = status
        self.spaces = space
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //设置子控件
    override func layoutSubviews() {
        
        super.layoutSubviews()
      layoutButtonWithEdgeInsetsStyle(self.status, space: self.spaces)
    
    }

    func layoutButtonWithEdgeInsetsStyle(style:JFAlignmentStatus,space:CGFloat) -> Void {
        let imageWidth:CGFloat = (self.imageView?.bounds.size.width)!
        let imageHeight:CGFloat = (self.imageView?.bounds.size.height)!
        
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        //由于ios8中的titleLabel的size为0 用这种方式设置
        if Float(UIDevice.currentDevice().systemVersion)>=8.0  {
            labelWidth = (self.titleLabel?.intrinsicContentSize().width)!
            labelHeight = (self.titleLabel?.intrinsicContentSize().height)!
        }else{
            labelWidth = (self.titleLabel?.frame.size.width)!
            labelHeight = (self.titleLabel?.frame.size.height)!
        }
        //申明全局的imageEdgeInsets与labelEdgeInsets
        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsetsZero
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsetsZero
        
        switch style {
           
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-space/2.0, 0, imageWidth+space/2.0);
        case .Top:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0);
        case .Bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWidth, 0, 0);
        }
        
        //赋值
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
    
    
}
