//
//  CollectionLayout.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 31/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import Foundation
import UIKit

class CollectionLayout: UICollectionViewLayout {
    fileprivate var numberOfColumns: Int = 3
    fileprivate var cellPending: CGFloat = 3
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right) - (cellPending * (CGFloat(numberOfColumns)-1))
    }
    
    fileprivate var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare(){
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        let itemsPerRow: Int = 3
        
        let normalColumnWidth: CGFloat = contentWidth / CGFloat(itemsPerRow)
        
        let normalColumnHeight: CGFloat = normalColumnWidth
        
        let featuredColumnWidth: CGFloat = (normalColumnWidth * 2) + cellPending
        
        let featuredColumnHeight: CGFloat = featuredColumnWidth
        
        var offsets: [CGFloat] = [CGFloat]()
    }
}
