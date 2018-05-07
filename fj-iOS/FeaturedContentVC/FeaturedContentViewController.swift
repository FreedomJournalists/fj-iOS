//
//  ViewController.swift
//  fj-iOS
//
//  Created by Tony Cioara on 4/28/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class FeaturedContentViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let smallContentCellId = "smallContentCellId"
    private let largeContentCellId = "largeContentCellId"
    
    private var cellHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellHeight = (self.view.frame.height - 30) / 2
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(SmallContentCell.self, forCellWithReuseIdentifier: smallContentCellId)
        collectionView?.register(LargeContentCell.self, forCellWithReuseIdentifier: largeContentCellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeContentCellId, for: indexPath) as! LargeContentCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: cellHeight)
    }

}

