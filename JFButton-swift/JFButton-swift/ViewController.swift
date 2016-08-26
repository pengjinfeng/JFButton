//
//  ViewController.swift
//  JFButton-swift
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 pengjf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
        let buttonLeft = JFButton.init(frame: CGRectMake(100, 100, 100, 50), status: JFAlignmentStatus.Left, space: 0)
        setButtonValues(buttonLeft)
        view.addSubview(buttonLeft)
        
        let buttonRight = JFButton.init(frame: CGRectMake(100, 200, 100, 50), status: JFAlignmentStatus.Right, space: 0)
        setButtonValues(buttonRight)
        view.addSubview(buttonRight)
        
        let buttonTop = JFButton.init(frame: CGRectMake(100, 300, 100, 50), status: JFAlignmentStatus.Top, space: 0)
        setButtonValues(buttonTop)
        view.addSubview(buttonTop)
        
        let buttonBottom = JFButton.init(frame: CGRectMake(100, 400, 100, 50), status: JFAlignmentStatus.Bottom, space: 0)
        setButtonValues(buttonBottom)
        view.addSubview(buttonBottom)
        
        
    }

    func setButtonValues(bu:JFButton) {
        bu.backgroundColor = UIColor.init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1.0)
        bu.setTitle("测试", forState: .Normal)
        bu.setTitleColor(UIColor.blackColor(), forState: .Normal)
        bu.setImage(UIImage.init(named: "pj_photo"), forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

