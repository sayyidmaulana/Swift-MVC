//
//  DetailAuthorCell.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class DetailAuthorCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let gradientView: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return view
    }()
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        lbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 15)
        return lbl
    }()
    
    let lblDescription: UITextView = {
        let lbl = UITextView()
        lbl.text = "Test Description Test Description Test Description Test DescriptionTest DescriptionTest Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description Test Description v Test Description Test Description Test Description"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.textAlignment = .justified
        lbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 12)
        return lbl
    }()
    
    let blankView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        gradiendViews()
        setupChild()
        
    }
    
    
    func setup() {
        addSubview(imageView)
        
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        
        addSubview(lblDescription)
        lblDescription.setAnchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: frame.height)
    }
    
    func gradiendViews() {
        blankView.frame.size = CGSize(width: frame.width, height: 200)
        
        addSubview(blankView)
        blankView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        let gradient = CAGradientLayer(layer: blankView.layer)
        gradient.colors = [UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1), UIColor.init(cgColor: #colorLiteral(red: 0.1428918394, green: 0.1428918394, blue: 0.1428918394, alpha: 1)).cgColor]
        
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 0)
        gradient.frame = blankView.bounds
        
        blankView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func setupChild() {
        addSubview(lblTitle)
        lblTitle.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 7, paddingRight: 0, width: 30, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
}
