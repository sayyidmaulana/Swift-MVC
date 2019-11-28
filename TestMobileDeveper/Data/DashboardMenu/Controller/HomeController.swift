//
//  HomeController.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    let arrayTopUp = [HomeModel(image: "children-music", title: "Genre"),
                      HomeModel(image: "book", title: "Buku"),
                      HomeModel(image: "writer", title: "Penulis")]
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Title"
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Subtitle"
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if view.traitCollection.horizontalSizeClass == .compact {
            titleStackView.axis = .vertical
            titleStackView.spacing = UIStackView.spacingUseDefault
        } else {
            titleStackView.axis = .horizontal
            titleStackView.spacing = 20.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation()
    }
    
    func setNavigation() {
        
        navigationItem.titleView = titleStackView
        
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeViewCell
        
        cell.homeCell = arrayTopUp[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 16 * 4) / 3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let genreController = GenreController()
//            let navController = UINavigationController(rootViewController: genreController)
//            present(navController, animated: true, completion: nil)
            navigationController?.pushViewController(genreController, animated: true)
            
        } else if indexPath.item == 1 {
            let bookController = BookController()
            navigationController?.pushViewController(bookController, animated: true)
            
        } else {
            let authorController = AuthorController()
            navigationController?.pushViewController(authorController, animated: true)
            
        }
    }
}
