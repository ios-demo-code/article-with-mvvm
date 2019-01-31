//
//  ArticleListViewModel.swift
//  Article-with-MVVM
//
//  Created by Soeng Saravit on 1/31/19.
//  Copyright © 2019 Soeng Saravit. All rights reserved.
//

import Foundation

class ArticleListViewModel {
    
    var articleViewModels = [ArticleViewModel]()
    
    func fetchArticles(page:Int, limit:Int, completion: @escaping ()->()) {
        ArticleService.shared.fetchArticles(page: page, limit: limit) { (articles) in
            self.articleViewModels = articles.compactMap(ArticleViewModel.init)
            
            completion()
        }
    }
    
}

class ArticleViewModel {
    var id:Int?
    var title:String?
    var description:String?
    var createdDate:String?
    var image:String?
    
    init(article:Article) {
        self.id = article.id
        self.title = article.title
        self.description = article.description
        self.createdDate = formatDate(date: article.createdDate!)
        self.image = checkImage(image: article.image)
    }
    
    func formatDate(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        if let newDate = dateFormatter.date(from: date) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
            
            return newDateFormatter.string(from: newDate)
        }
        return "DATE NOT AVAILABLE"
    }
    
    func checkImage(image:String?) -> String {
        if let image = image {
            return image
        }else{
            return "https://www.greatplacetowork.com/templates/gptw/images/no-image-available.jpg"
        }
    }
}
