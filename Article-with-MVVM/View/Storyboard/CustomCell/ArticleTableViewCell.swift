//
//  ArticleTableViewCell.swift
//  Article-with-MVVM
//
//  Created by Soeng Saravit on 1/31/19.
//  Copyright © 2019 Soeng Saravit. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(artilceViewModel:ArticleViewModel) {
        self.titleLabel.text = artilceViewModel.title
        self.createdDateLabel.text = artilceViewModel.createdDate
        self.articleImageView.kf.setImage(with: URL(string: artilceViewModel.image!))
    }

}
