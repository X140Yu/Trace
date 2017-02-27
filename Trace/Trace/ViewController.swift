//
//  ViewController.swift
//  Trace
//
//  Created by X140Yu on 2/25/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var cardView: CardView!

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.registerCardCell(c: SearchCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "SearchCollectionViewCell", bundle: nil))
        cardView.registerCardCell(c: FeedCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "FeedCollectionViewCell", bundle: nil))
        cardView.registerCardCell(c: ProfileCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "ProfileCollectionViewCell", bundle: nil))
        cardView.cardDataSource = self
        cardView.set(cards: generateCardInfo(cardCount: 3))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func generateCardInfo (cardCount:Int) -> [AnyObject] {
        var arr = [AnyObject]()
        let xibName = ["SearchCollectionViewCell", "FeedCollectionViewCell", "ProfileCollectionViewCell"]

        for i in 0..<cardCount {
            //            let value = Int(arc4random_uniform(3))
            arr.append(xibName[i] as AnyObject)
        }

        return arr
    }
}

extension ViewController: CardCollectionViewDataSource {
    func cardView(collectionView: UICollectionView, item: AnyObject, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item as! String, for: indexPath)
        switch cell {
        case let c as SearchCollectionViewCell:
            c.disablePan = true
            break
        case _ as FeedCollectionViewCell:
            break
        case _ as ProfileCollectionViewCell:
            break
        default:
            return UICollectionViewCell()
        }
        return cell
    }
}

