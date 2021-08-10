//
//  DetailsViewController.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {
    
    static let identifier = "DetailsViewController"

    @IBOutlet weak var webView: WKWebView!
    
    private var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebview()
    }
    
    func loadWebview() {
        guard let url = url else { return }
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
    }
    
    func showArticle(_ article: Article) {
        guard let url = URL(string: article.url ?? "") else {
            return
        }
        self.url = url
        title = article.title ?? ""
    }

}

// MARK: WKNavigationDelegate

extension DetailsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showLoadingError()
    }
    
    private func showLoadingError() {
        let alert = UIAlertController(title: "Error", message: "An error ocurred while loading.", preferredStyle: .alert)
        let accept = UIAlertAction(title: "Accept", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(accept)
        self.present(alert, animated: true, completion: nil)
    }
}
