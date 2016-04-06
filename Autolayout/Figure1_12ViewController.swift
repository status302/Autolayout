//
//  Figure1_12ViewController.swift
//  Autolayout
//
//  Created by 程庆春 on 16/4/6.
//  Copyright © 2016年 Qiuncheng. All rights reserved.
//

import UIKit

class Figure1_12ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        v1.addConstraint(NSLayoutConstraint(item: v2,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: v1,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
        
        v1.addConstraint(NSLayoutConstraint(item: v2,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: v1,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
        
        v1.addConstraint(NSLayoutConstraint(item: v2,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: v1,
            attribute: .Top,
            multiplier: 1,
            constant: 0))
        
        v2.addConstraint(NSLayoutConstraint(item: v2,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 10))
        
        v3.addConstraint(NSLayoutConstraint(item: v3,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 20))
        
        
        v3.addConstraint(NSLayoutConstraint(item: v3,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 20))
        
        v1.addConstraint(NSLayoutConstraint(item: v3,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: v1,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
        
        v1.addConstraint(NSLayoutConstraint(item: v3,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: v1,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0))
        
    }

}
