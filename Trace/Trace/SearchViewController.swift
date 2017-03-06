//
//  SearchViewController.swift
//  Trace
//
//  Created by X140Yu on 2/26/17.
//  Copyright © 2017 X140Yu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

typealias SearchResult = String

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    fileprivate struct keys {
        static let cellID = "cell"
    }

    var results = [String]()
    let disposeBag = Disposables.create()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: keys.cellID)

        results = ["a", "ab", "a0", "a123asd", "asdjkl"].map({ (str) -> String in
            return "User: " + str
        })

//        textField.rx.text.orEmpty
//            .throttle(0.3, scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
            //.flatMapLatest { [unowned self] (query) -> Observable<SearchResult>  in
            //    if query.isEmpty {
            //        return Observable.just("")
            //    }

            //   var res = [String]()
            //    res.append(query)
            //    for i in 1..<10 {
            //        res.append(query +  self.randomAlphaNumericString(length: i))
            //    }

            //    return Observable.create({ (subscriber) -> Disposable in
            //        res.forEach({ (str) in
            //            subscriber.onNext(str)
            //        })
            //        subscriber.onCompleted()
            //        return Disposables.create()
            //    })
            //}

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: keys.cellID, for: indexPath)
        cell.textLabel?.text = results[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
