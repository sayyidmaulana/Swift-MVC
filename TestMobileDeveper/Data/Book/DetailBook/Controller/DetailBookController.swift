//
//  DetailBookController.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

import UIKit

class DetailBookController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellId = "cellId"
    var bookId = ""
    
    var bookData = [DetailBookModel.ResultBean]()
    
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
        checkBook()
    }
    
    func setNavigation() {
        navigationItem.title = "Detail Buku"
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DetailBookCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailBookCell
        
        let items = bookData[indexPath.row]
        
        cell.lblTitle.text = items.title
        
        cell.lblDescription.text = items.desc
        
        let str = items.cover_url! + urlImageKey
        let replaced = str.replacingOccurrences(of: "covers%2F", with: urlImage)

        if let imageURL = URL(string: replaced) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func checkBook() {
        
        CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .gray)
        
        let myUrl = URL(string: filterBook(book_id: bookId))
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        request.addValue(headerValue, forHTTPHeaderField: headerKey)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                let JSONData = try JSONDecoder().decode(DetailBookModel.self, from: data)
                
                self.bookData = [JSONData.result]
                
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
