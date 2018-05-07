//
//  LargeContentCell.swift
//  fj-iOS
//
//  Created by Tony Cioara on 4/28/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class LargeContentCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var subViewWidth: CGFloat!
    
    private let largeCampaignCollectionViewCellId = "largeCampaignCollectionViewCellId"
    
    let largeCampaignsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupViews()
    }

    private func indexOfMajorCell() -> Int {
        let itemWidth = subViewWidth
        let proportionalOffset = largeCampaignsCollectionView.collectionViewLayout.collectionView!.contentOffset.x / itemWidth!
        return Int(round(proportionalOffset))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subViewWidth = self.frame.width * 0.9
        setupViews()
    }
    
    func setupViews() {
        
        
        largeCampaignsCollectionView.dataSource = self
        largeCampaignsCollectionView.delegate = self
        addSubview(largeCampaignsCollectionView)
        largeCampaignsCollectionView.register(LargeCampaignCollectionViewCell.self, forCellWithReuseIdentifier: largeCampaignCollectionViewCellId)
        
        largeCampaignsCollectionView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCampaignCollectionViewCellId, for: indexPath) as! LargeCampaignCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: subViewWidth, height: self.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        
        let indexOfMajorCell = self.indexOfMajorCell()
        
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        largeCampaignsCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
        print("Hello")
        backgroundColor = UIColor.green
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(self.frame.height * 0.7)
        }
    }
}
