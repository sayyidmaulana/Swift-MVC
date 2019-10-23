//
//  DetailGenreModel.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct DetailGenreModel: Decodable {
    let success: Bool
    let result: [ResultBean]
    
    struct ResultBean: Decodable {
        let id: Int?
        let title: String?
        let cover_url: String?
        let writer_id: Int?
        let created_at: String?
        let schedule_task: String?
        let status: String
        
        let genre_id: Int?
        let isNew: Bool
        let view_count: Int?
        let rate_sum: Double?
        let is_update: Bool
        let book_url: String?
        let chapter_count: Int?
        
        let Writer_by_writer_id: WriterByWriterId
        
        let Genre_by_genre_id: GenreByGenreId
        
        struct GenreByGenreId: Decodable {
            let id: Int?
            let title: String?
            let icon_url: String?
        }
        
        struct WriterByWriterId: Decodable {
            let id: Int?
            let user_id: Int?
            let created_at: String?
            let kelas: String?
            let status: String?
            let schedule_task: String?
            let royalty_id: Int?
            let User_by_user_id: UserByUserId
            
            struct UserByUserId: Decodable {
                let id: Int?
                let name: String?
            }
        }
    }
}
