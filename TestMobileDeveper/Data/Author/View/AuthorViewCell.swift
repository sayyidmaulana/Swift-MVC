//
//  AuthorViewCell.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class AuthorViewCell: UICollectionViewCell {
    let imgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    let lblTitleGL: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
        return lbl
    }()
    
    let lblDesciption: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.init(name: "HelveticaNeue", size: 12)
        lbl.textColor = .gray
        lbl.text = "Sebarkan cerita anda ke seluruh dunia"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        cellShadow()
        
        addSubview(imgView)
        imgView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 60, height: 60)
        
        addSubview(lblTitleGL)
        lblTitleGL.setAnchor(top: imgView.topAnchor, left: imgView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 12, paddingBottom: 0, paddingRight: 0)
        
        addSubview(lblDesciption)
        lblDesciption.setAnchor(top: lblTitleGL.bottomAnchor, left: imgView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 15, paddingRight: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func cellShadow() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.cornerRadius = 10
    }
}
