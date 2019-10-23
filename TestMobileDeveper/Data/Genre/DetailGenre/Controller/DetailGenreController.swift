//
//  DetailGenreController.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class DetailGenreController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cellId = "cellId"
    var genreId = ""
    
    
    var genreDetailData = [DetailGenreModel.ResultBean]()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        setCollectionView()
        checkDetailGenre()
    }
    
    func setNavigation() {
        navigationItem.title = "Detail Genre"
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DetailGenreCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreDetailData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailGenreCell
        
        let items = genreDetailData[indexPath.row]
        
        cell.lblTitleGL.text = items.title
        
        let str = items.cover_url! + urlImageKey
        let replaced = str.replacingOccurrences(of: "covers%2F", with: urlImage)
        
        if let imageURL = URL(string: replaced) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width - 15 * 2, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func checkDetailGenre() {
        
        CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .gray)
        
        let myUrl = URL(string: filterGenre(genre_id: genreId))
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        request.addValue(headerValue, forHTTPHeaderField: headerKey)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                let JSONData = try JSONDecoder().decode(DetailGenreModel.self, from: data)
                
                self.genreDetailData = JSONData.result
                
                DispatchQueue.main.async {
                    print(JSONData)
                    self.collectionView.reloadData()
                    
                    CustomActivityIndicator.shared.hide(uiView: self.view)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }

}
