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
        
        var xoffsets: [CGFloat] = [CGFloat]()
        
        for item in 0..<6 {
            let multiplier = item % 3
            
            let xPos = CGFloat(multiplier) * (normalColumnWidth + cellPending)
            xoffsets.append(xPos)
        }
        
        xoffsets.append(0.0)
        for _ in 0..<2 {
            xoffsets.append(featuredColumnWidth + cellPending)
        }
        
        var yOffsets: [CGFloat] = [CGFloat]()
        for item in 0..<9 {
            
            var _yPos = floor(Double(item/3)) * (Double(normalColumnHeight) + Double(cellPending))
            
            if item == 8 {
                _yPos += (Double(normalColumnHeight) + Double(cellPending))
            }
            
            yOffsets.append(CGFloat(_yPos))
            
        }
        
        
        let numberOfItemPerSection: Int = 9
        
        let heightOfSection: CGFloat = 4 * normalColumnHeight + (4 * cellPending)
        
        var itemInSection: Int = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
        
        let indexPath = IndexPath(item: item, section: 0)
        
        let xPos = xoffsets[itemInSection]
            
            let multiplier: Double = floor(Double(item) / Double(numberOfItemPerSection))
            
            let yPos = yOffsets[itemInSection] + (heightOfSection * CGFloat(multiplier))
            
            var cellWidth = normalColumnWidth
            
            var cellHeight = normalColumnHeight
            
            if (itemInSection + 1) % 7 == 0 && itemInSection != 0 {
                
                cellWidth = featuredColumnWidth
                cellHeight = featuredColumnHeight
            }
            
            let frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = frame
            
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            itemInSection = itemInSection < (numberOfItemPerSection - 1) ? (itemInSection + 1) : 0
            
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    
}
