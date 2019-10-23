//
//  ModelBook.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct ModelBook: Decodable {
    let success: Bool
    let result: [ResultBean]
    
    struct ResultBean: Decodable {
        let id: Int?
        let title: String?
        let writer_id: Int?
        let cover_url: String?
        let created_at: String?
        let schedule_task: String?
        let status: String?
        let category: String?
        let is_update: Bool
        let book_id: Int?
        let book_url: String?
        let isNew: Bool
        let view_count: Int?
        let rate_sum: Double?
        let chapter_count: Int?
        let Writer_by_writer_id: WriteByWriterId
        
        struct WriteByWriterId: Decodable {
            let id: Int?
            let user_id: Int?
            let User_by_user_id: UserByUserId
            
            struct UserByUserId: Decodable {
                let id: Int?
                let name: String?
            }
        }
    }
}

