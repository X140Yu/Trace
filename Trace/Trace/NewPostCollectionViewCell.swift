//
//  NewPostCollectionViewCell.swift
//  Trace
//
//  Created by X140Yu on 3/5/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//

import UIKit

class NewPostCollectionViewCell: CardCell {

    var navigationController: UINavigationController!
    var rootViewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        rootViewController = NewPostViewController(nibName: "NewPostViewController", bundle: nil)
        contentView.addSubview(rootViewController.view)
        rootViewController.view.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView.snp.edges)
        }
        //navigationController = UINavigationController(rootViewController: rootViewController)
        //navigationController.setNavigationBarHidden(true, animated: true)

        //self.contentView.addSubview(navigationController.view)
        //navigationController.view.snp.makeConstraints { (make) in
        //    make.edges.equalTo(contentView.snp.edges)
        //}
    }
}

extension NewPostCollectionViewCell: CardCellProtocol {
    static func cellIdentifier() -> String {
        return "NewPostCollectionViewCell"
    }
}
