//
//  ViewController.swift
//  Trace
//
//  Created by X140Yu on 2/25/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

