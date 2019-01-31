//
//  ViewController.swift
//  Article-with-MVVM
//
//  Created by Soeng Saravit on 1/31/19.
//  Copyright © 2019 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articleListViewModel:ArticleListViewModel?
    var page = 1
    var limit = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.articleListViewModel = ArticleListViewModel()
        
        self.articleListViewModel?.fetchArticles(page: page, limit: limit, completion: {
            self.tableView.reloadData()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articleViewModels = self.articleListViewModel?.articleViewModels {
            return articleViewModels.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as! ArticleTableViewCell
        
        let articleViewModel = self.articleListViewModel?.articleViewModels[indexPath.row]
        cell.configureCell(artilceViewModel: articleViewModel!)
        
        return cell
    }
}

