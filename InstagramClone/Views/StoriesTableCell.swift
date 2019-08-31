//
//  StoriesTableCell.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 31/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

class StoriesTableCell: UITableViewCell ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
//    lazy var  stories:[Story] = {
//        let model = Model()
//        return model.storylist
//    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        collectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.storyImage.image = stories[indexPath.row].post.postImage
        cell.userNameLabel.text = stories[indexPath.row].post.user.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
    }
}
