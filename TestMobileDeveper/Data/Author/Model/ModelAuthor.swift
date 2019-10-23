//
//  ModelAuthor.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct ModelAuthor: Decodable {
    let success: Bool
    let result: [ResultBean]
    
    struct ResultBean: Decodable {
        let id: Int?
        let name: String?
        let username: String?
        let photo_url: String?
        let is_following: Bool
        let user_id: Int?
        let count_follower: Int?
        let Writer_by_user_id: WriterByUserId
        
        struct WriterByUserId: Decodable {
            let id: Int?
            let user_id: Int?
            let status: String?
            let schedule_task: String?
        }
    }
}
