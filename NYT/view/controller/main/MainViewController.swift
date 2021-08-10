//
//  MainViewController.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import UIKit
import MultiSelectSegmentedControl

class MainViewController: UIViewController {

    @IBOutlet weak var segmentArticleType: UISegmentedControl!
    @IBOutlet weak var segmentDaysPeriod: UISegmentedControl!
    @IBOutlet weak var segmentSocialType: MultiSelectSegmentedControl!
    @IBOutlet weak var socialTypeContainer: UIView!
    
    private var articleType: ArticleType = .mostEmailed
    private var daysPeriod: DaysPeriod = .one
    private var socialNetworks: [String] = []
    
    private var posibleNetworks: [String] = ["facebook", "twitter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Article search"
        
        setup()
        checkMostShared()
    }
    
    func setup() {
        segmentSocialType.items = ["Facebook", "Twitter"]
        segmentSocialType.delegate = self
    }
    
    func checkMostShared() {
        socialTypeContainer.isHidden = articleType != .mostShared
        
        // Deselect all items previusly selected
        if socialTypeContainer.isHidden {
            socialNetworks.removeAll()
            segmentSocialType.selectedSegmentIndexes = []
        }
    }
    
}

// MARK: - Actions

extension MainViewController {
    @IBAction func actionArticleType(_ sender: Any) {
        if let segment = sender as? UISegmentedControl, let type = ArticleType(rawValue: segment.selectedSegmentIndex) {
            articleType = type
            checkMostShared()
        }
    }
    
    @IBAction func actionDaysPeriod(_ sender: Any) {
        if let segment = sender as? UISegmentedControl, let days = DaysPeriod(rawValue: segment.selectedSegmentIndex) {
            daysPeriod = days
        }
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        NYTApi.getArticles(type: articleType, days: daysPeriod, socials: socialNetworks) { result in
            switch result {
            case let .success(articles):
                print("\(articles)")
            case let .failure(error):
                print("\(error)")
            }
        }
    }
}

// MARK: - MultiSegmentDelegate

extension MainViewController: MultiSelectSegmentedControlDelegate {
    func multiSelect(_ multiSelectSegmentedControl: MultiSelectSegmentedControl, didChange value: Bool, at index: Int) {
        if value {
            socialNetworks.append(posibleNetworks[index])
        } else {
            if socialNetworks.contains(posibleNetworks[index]) {
                socialNetworks.removeAll { $0 == posibleNetworks[index] }
            }
        }
    }
}
