//
//  DetailAuthorModel.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct DetailAuthorModel: Decodable {
    let success: Bool
    let result: ResultBean
    
    struct ResultBean:Decodable {
        let id: Int?
        let name: String?
        let username: String?
        let photo_url: String?
        let email: String?
        let phone: String?
        let link_user: String?
        let coin: Int?
        let deskripsi: String?
        let gender: String?
        let birthday: String?
    }
}
