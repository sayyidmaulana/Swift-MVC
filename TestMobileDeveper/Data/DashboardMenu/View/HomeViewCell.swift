//
//  HomeViewCell.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    let imgView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let lblTitleTP: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.font = UIFont.init(name: "HelveticaNeue", size: 12)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    var homeCell: HomeModel? {
        didSet {
            
            guard let images = homeCell?.image else { return }
            guard let titles = homeCell?.title else { return }
            
            imgView.image = UIImage(named: images)
            lblTitleTP.text = titles
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupView()
    }
    
    func setupView() {
        cellShadow()
        
        addSubview(imgView)
        imgView.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: frame.height - 40)
        
        addSubview(lblTitleTP)
        lblTitleTP.setAnchor(top: imgView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func cellShadow() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
