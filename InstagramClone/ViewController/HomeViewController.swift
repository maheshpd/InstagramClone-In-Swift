//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 17/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
//    lazy var posts: [Post] = {
//        let model = Model()
//        return model.postlist
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.estimatedRowHeight = CGFloat(88.0)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        tableView.register(UINib(nibName: "StoriesTableCell", bundle: nil), forCellReuseIdentifier: "StoriesTableCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        var rightBarItemImage = UIImage(named: "send_tabbar_icon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)
        
        var leftBarItemImage = UIImage(named: "Camera")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: nil, action: nil)
        
        let profileImageView = UIImageView(image: UIImage(named: "instagramlogo"))
        self.navigationItem.titleView = profileImageView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
}
