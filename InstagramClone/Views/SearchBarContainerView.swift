//
//  SearchBarContainerView.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 31/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {

    let searchBar: UISearchBar
    
    init(customeSearchBar: UISearchBar) {
        searchBar = customeSearchBar
        super.init(frame: CGRect.zero)
        
        addSubview(searchBar)
    }
    
    convenience  override init(frame: CGRect) {
        self.init(customeSearchBar: UISearchBar())
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = bounds
    }
    
}
