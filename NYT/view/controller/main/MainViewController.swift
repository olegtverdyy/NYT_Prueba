//
//  MainViewController.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import UIKit
import MultiSelectSegmentedControl
import JGProgressHUD

class MainViewController: UIViewController {
    
    @IBOutlet weak var segmentArticleType: UISegmentedControl!
    @IBOutlet weak var segmentDaysPeriod: UISegmentedControl!
    @IBOutlet weak var segmentSocialType: MultiSelectSegmentedControl!
    @IBOutlet weak var socialTypeContainer: UIView!
    
    private var articleType: ArticleType = .mostEmailed
    private var daysPeriod: DaysPeriod = .one
    private var socialNetworks: [SocialNetworks] = [SocialNetworks]()
    
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = LS.string(.title_article_search)
        
        setup()
        checkMostShared()
    }
    
    func setup() {
        segmentSocialType.items = SocialNetworks.allCases.map { $0.rawValue.capitalized }
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
        hud.show(in: view)
        NYTApi.getArticles(type: articleType, days: daysPeriod, socials: socialNetworks) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(articles):
                DispatchQueue.main.async {
                    self.hud.dismiss()
                    if articles.count == 0 {
                        self.showEmpty()
                    } else {
                        guard let resultsView = self.storyboard?.instantiateViewController(withIdentifier: ListArticlesViewController.identifier) as? ListArticlesViewController else { return }
                        resultsView.setupArticles(articles)
                        self.navigationController?.pushViewController(resultsView, animated: true)
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.hud.dismiss()
                }
            }
        }
    }
    
    private func showEmpty() {
        let alert = UIAlertController(title: LS.string(.title_info), message: LS.string(.description_empty), preferredStyle: .alert)
        let accept = UIAlertAction(title: LS.string(.accept_button), style: .default)
        alert.addAction(accept)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - MultiSegmentDelegate

extension MainViewController: MultiSelectSegmentedControlDelegate {
    func multiSelect(_ multiSelectSegmentedControl: MultiSelectSegmentedControl, didChange value: Bool, at index: Int) {
        if value {
            socialNetworks.append(SocialNetworks.allCases[index])
        } else {
            if socialNetworks.contains(SocialNetworks.allCases[index]) {
                socialNetworks.removeAll { $0 == SocialNetworks.allCases[index] }
            }
        }
    }
}
