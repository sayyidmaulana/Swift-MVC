//
//  GenreModel.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct GenreModel: Decodable {
    let resource: [ResourceBean]
    
    struct ResourceBean: Decodable {
        let id: Int?
        let title: String?
        let icon_url: String?
    }
}
