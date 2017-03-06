//
//  Helper.swift
//  Trace
//
//  Created by X140Yu on 3/6/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//

import Foundation
import UIKit

public struct Helper {
    static func rootViewController() -> ViewController {
        return UIApplication.shared.delegate?.window!!.rootViewController as! ViewController
        //let a = UIStoryboard(name: "Main", bundle: nil)
        //return a.instantiateInitialViewController() as! ViewController
    }
    
    static func cardCollectionView() -> CardView {
        return rootViewController().cardView
    }
}
