//
//  DetailBookModel.swift
//  TestMobileDeveper
//
//  Created by Keen on 23/10/19.
//  Copyright © 2019 iosapp. All rights reserved.
//

struct DetailBookModel: Decodable {
    let success: Bool
    let result: ResultBean
    
    struct ResultBean: Decodable {
        let id: Int?
        let title: String?
        let synopsis: String?
        let cover_url: String?
        let status: String?
        let writer_id: Int?
        let download: String?
        let schedule_daily: Int?
        let created_at: String?
        let updated_at: String?
        let category: String?
        let nominasi: String?
        let challenge_id: String?
        let daily: String?
        let is_contract_actived: Bool
        let schedule_task: String?
        let isNew: Bool
        let time_to_vote: Bool
        let vote_count: String?
        let voted: Bool
        let book_url: String?
        let full_price: Int?
        let full_purchase: Bool
        let url_landing: String?
        let desc: String?
    }
}
