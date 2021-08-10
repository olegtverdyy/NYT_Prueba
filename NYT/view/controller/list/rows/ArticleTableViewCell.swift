//
//  ArticleTableViewCell.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: String {
        return String(describing: self)
    }
    
    static let height: CGFloat = 140
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbSection: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupStyle()
    }
    
    func setupStyle() {
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 3.0
        containerView.layer.shadowOffset = .init(width: 2.0, height: 2.0)
        
        imgArticle.layer.cornerRadius = 18
        imgArticle.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        imgArticle.image = nil
    }
    
    func loadArticle(_ article: Article) {
        if let image = article.media?.first?.mediaMetadata?.last, let imageUrl = URL(string: image.url ?? "") {
            imgArticle.kf.setImage(with: imageUrl, placeholder: UIImage(named: "placeholder"))
        }
        lbTitle.text = article.title ?? ""
        lbAuthor.text = article.author ?? ""
        lbDate.text = article.publishedDate ?? ""
        lbSection.text = article.section ?? ""
    }
    
}
