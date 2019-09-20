//
//  App_BTN.swift
//  Noyo
//
//  Created by Retina on 20/08/18.
//  Copyright © 2018 Pavan. All rights reserved.
//

import UIKit

class App_BTN: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var gradient: CAGradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if CurrentDevice.IS_IPHONE {
            if CurrentDevice.IS_IPHONE_6_OR_HIGHER {
                self.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            } else {
                self.titleLabel?.font =  UIFont.systemFont(ofSize: 16.0, weight: .semibold)
            }
        } else {
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
        }
        self.layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        self.setTitleColor(UIColor.white, for: .normal)
        gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: 75.0/255.0, green: 168.0/255.0, blue: 248.0/255.0, alpha: 1.0), UIColor(red: 41.0/255.0, green: 110.0/255.0, blue: 247.0/255.0, alpha: 1.0)].map { $0.cgColor }
        gradient.cornerRadius = 5.0
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if CurrentDevice.IS_IPHONE {
            if CurrentDevice.IS_IPHONE_6_OR_HIGHER {
                self.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            } else {
                self.titleLabel?.font =  UIFont.systemFont(ofSize: 16.0, weight: .semibold)
            }
        } else {
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
        }
        self.layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        self.setTitleColor(UIColor.white, for: .normal)
        gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: 75.0/255.0, green: 168.0/255.0, blue: 248.0/255.0, alpha: 1.0), UIColor(red: 41.0/255.0, green: 110.0/255.0, blue: 247.0/255.0, alpha: 1.0)].map { $0.cgColor }
        gradient.cornerRadius = 5.0
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = self.bounds
    }
}
