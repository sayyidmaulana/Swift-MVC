//
//  AuthorController.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class AuthorController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cellId = "cellId"
    
    var authorData = [ModelAuthor.ResultBean]()
    
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
        checkAuthor()
    }
    
    func setNavigation() {
        navigationItem.title = "Penulis"
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(AuthorViewCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return authorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AuthorViewCell
        
        let items = authorData[indexPath.row]
        
        cell.lblTitleGL.text = items.name
        
        let replaced = urlImageProfil + items.photo_url! + urlImageKey
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let items = authorData[indexPath.item]
        
        let authorId = items.user_id ?? 0
        
        let detailAuthorController = DetailAuthorController()
        detailAuthorController.authorId = "\(authorId)"
        navigationController?.pushViewController(detailAuthorController, animated: true)
        
    }
    
    func checkAuthor() {
        
        CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .gray)
        
        let myUrl = URL(string: author)
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        request.addValue(headerValue, forHTTPHeaderField: headerKey)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                let JSONData = try JSONDecoder().decode(ModelAuthor.self, from: data)
                
                self.authorData = JSONData.result
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                    
                    CustomActivityIndicator.shared.hide(uiView: self.view)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
}
