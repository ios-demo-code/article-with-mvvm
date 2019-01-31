//
//  Article.swift
//  Article-with-MVVM
//
//  Created by Soeng Saravit on 1/31/19.
//  Copyright © 2019 Soeng Saravit. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article {
    var id:Int?
    var title:String?
    var description:String?
    var createdDate:String?
    var image:String?
    
    init(json:JSON) {
        self.id = json["ID"].int
        self.title = json["TITLE"].string
        self.description = json["DESCRIPTION"].string
        self.createdDate = json["CREATED_DATE"].string
        self.image = json["IMAGE"].string
    }
}
