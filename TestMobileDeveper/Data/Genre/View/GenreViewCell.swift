//
//  GenreViewCell.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class GenreViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let lblTitleGL: UILabel = {
        let lbl = UILabel()
        lbl.text = "Genre 1"
        lbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
        return lbl
    }()
    
    let imgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "next")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        
        addSubview(containerView)
        containerView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        addSubview(imgView)
        imgView.setAnchor(top: containerView.topAnchor, left: nil, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        
        addSubview(lblTitleGL)
        lblTitleGL.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: imgView.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
