//
//  ListArticlesViewController.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import UIKit

class ListArticlesViewController: UIViewController {
    
    static let identifier = "ArticlesDetails"
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article] = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCells()
        setupStyle()
    }
    
    func setupStyle() {
        title = "Results"
        
        tableView.backgroundView = UIView()
        tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: ArticleTableViewCell.nib, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }
    
    func setupArticles(_ articles: [Article]) {
        self.articles = articles
    }
    
    func goToDetails(_ article: Article) {
        guard let details = storyboard?.instantiateViewController(withIdentifier: DetailsViewController.identifier) as? DetailsViewController else { return }
        details.showArticle(article)
        navigationController?.pushViewController(details, animated: true)
    }

}

// MARK: - UITableViewDelegate - UITableViewDatasource

extension ListArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ArticleTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier) as? ArticleTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        cell.loadArticle(articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.async { [weak self] () in
            guard let self = self else { return }
            self.goToDetails(self.articles[indexPath.row])
        }
    }
}
