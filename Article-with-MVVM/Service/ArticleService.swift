//
//  ArticleService.swift
//  Article-with-MVVM
//
//  Created by Soeng Saravit on 1/31/19.
//  Copyright © 2019 Soeng Saravit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ArticleService {
    static let shared = ArticleService()
    let BASE_URL = "http://api-ams.me"
    let headers:HTTPHeaders = [
        "Accept":"application/json",
        "Content-Type":"application/json"
    ]
    
    func fetchArticles(page:Int, limit:Int, completion: @escaping(_ articles: [Article])->Void) {
        let GET_URL = BASE_URL + "/v1/api/articles?page=\(page)&limit=\(limit)"
        
        Alamofire.request(GET_URL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                var articles = [Article]()
                
                let jsonData = try? JSON(data: response.data!)
                
                for articleJSON in jsonData!["DATA"].array! {
                        articles.append(Article(json: articleJSON))
                }
                completion(articles)
            }
        }
    }
}
