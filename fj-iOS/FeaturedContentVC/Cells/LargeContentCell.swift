//
//  LargeContentCell.swift
//  fj-iOS
//
//  Created by Tony Cioara on 4/28/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class LargeContentCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let largeCampaignCollectionViewCellId = "largeCampaignCollectionViewCellId"
    
    let largeCampaignsCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.red
        
        addSubview(largeCampaignsCollectionView)
        
        largeCampaignsCollectionView.dataSource = self
        largeCampaignsCollectionView.delegate = self
        
        largeCampaignsCollectionView.register(LargeCampaignCollectionViewCell.self, forCellWithReuseIdentifier: largeCampaignCollectionViewCellId)
        
        largeCampaignsCollectionView.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("!@#$")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCampaignCollectionViewCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: self.frame.height)
    }
}

class LargeCampaignCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.green
    }
}
