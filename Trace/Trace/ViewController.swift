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

    private var cards = [AnyObject]()

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.registerCardCell(c: SearchCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "SearchCollectionViewCell", bundle: nil))
        cardView.registerCardCell(c: FeedCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "FeedCollectionViewCell", bundle: nil))
        cardView.registerCardCell(c: ProfileCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "ProfileCollectionViewCell", bundle: nil))
        cardView.registerCardCell(c: NewPostCollectionViewCell.classForCoder(), nib: UINib.init(nibName: "NewPostCollectionViewCell", bundle: nil))

        cardView.cardDataSource = self

        cards = generateCardInfo(cardCount: 2)
        cardView.set(cards: cards)
        cardView.selectAt(index: 1)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    public func showProfileVC(userID: String) {
        for c in cards {
            if c.isEqual("ProfileCollectionViewCell") {
                return
            }
        }

        cards.append("ProfileCollectionViewCell" as AnyObject)
        cardView.addCard(card: "ProfileCollectionViewCell" as AnyObject)
        DispatchQueue.main.asyncAfter(deadline: .now()  + 0.3) {
            self.cardView.selectAt(index: self.cards.count - 1)
        }
    }

    public func showNewPostVC() {
        for c in cards {
            if c.isEqual("NewPostCollectionViewCell") {
                return
            }
        }

        cards.append("NewPostCollectionViewCell" as AnyObject)
        cardView.addCard(card: "NewPostCollectionViewCell" as AnyObject)
        DispatchQueue.main.asyncAfter(deadline: .now()  + 0.3) {
            self.cardView.selectAt(index: self.cards.count - 1)
        }
    }

    func generateCardInfo (cardCount:Int) -> [AnyObject] {
        var arr = [AnyObject]()
        let xibName = ["SearchCollectionViewCell", "FeedCollectionViewCell"]

        for i in 0..<cardCount {
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
        case _ as NewPostCollectionViewCell:
            break
        default:
            return UICollectionViewCell()
        }
        return cell
    }
}

