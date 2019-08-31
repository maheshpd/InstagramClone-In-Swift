//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 17/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollection = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = false
        
        for subView in searchController.searchBar.subviews {
            for subView1 in subView.subviews {
                if let textField = subView1 as? UITextField {
                    textField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
                    
                    textField.textAlignment = NSTextAlignment.center
                }
            }
        }
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        let searchBarController = SearchBarContainerView(customeSearchBar: searchController.searchBar)
        searchBarController.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBarController
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        return cell
    }
    
}
