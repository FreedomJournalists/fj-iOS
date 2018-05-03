//
//  ContentCategoryCell.swift
//  fj-iOS
//
//  Created by Tony Cioara on 4/28/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class SmallContentCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.black
    }
}
