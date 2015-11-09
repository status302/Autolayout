//
//  ViewController.swift
//  Autolayout
//
//  Created by 程庆春 on 15/11/8.
//  Copyright © 2015年 Qiuncheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure: Bool = false { didSet { updateUI() } }
    var loggedInUser: User? { didSet { updateUI() } }
    
    private func updateUI(){
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password" : "Password"
        nameLabel.text = loggedInUser?.name
        companyLabel.text = loggedInUser?.company
        imageView.image = loggedInUser?.image
        
    }
    @IBAction func loginToggled(sender: UIButton) {
        loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
    }
    @IBAction func changeSecurityToggled(sender: UIButton) {
        secure = !secure
        updateUI()
    }
    
    var image: UIImage? {
        get {
                return imageView.image
        }
        set {
            imageView.image = newValue
            if let contraintedView = imageView {
                if let newImage = newValue {
                    aspectRatioConstraint = NSLayoutConstraint(
                        item: contraintedView,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: contraintedView,
                        attribute: .Height,
                        multiplier: newImage.aspectRatio,
                        constant: 0)
                } else {
                    aspectRatioConstraint = nil
                }
            }
        }
        
    }
    var aspectRatioConstraint: NSLayoutConstraint? {
        // 移除掉原有的约束
        willSet {
            if let exitingContraint = aspectRatioConstraint {
                view.removeConstraint(exitingContraint)
            }
        }
        // 将约束添加到视图中
        didSet {
            if let newContraint = aspectRatioConstraint {
                view.addConstraint(newContraint)
            }
        }
    }
    
    
}

extension User{
    var image: UIImage? {
        if let image =  UIImage(named: login){
            return image
        } else {
            return UIImage(named: "unknown_user")
        }
    }
}

extension UIImage {
    var aspectRatio: CGFloat{
        return size.height != 0 ? size.width / size.height : 0
    }
}

