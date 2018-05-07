//
//  View.swift
//  fj-iOS
//
//  Created by Tony Cioara on 5/2/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import SnapKit

class View: UIView {
    
    private var view = UIView()
    private var view2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.view2.backgroundColor = UIColor.blue
        
        self.view.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
        }
        
        self.view.backgroundColor = UIColor.blue
        
        self.view2.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(view.snp.right).offset(10)
        }
    }
    
    func setConstraints() {
    }
}
