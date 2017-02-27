//
//  UIViewExtension.swift
//  Pods
//
//  Created by X140Yu on 2/26/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//
//

import UIKit

extension UIView {

    func setShadow(offset:CGSize,radius:CGFloat,opacity:Float) {

        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }

}


