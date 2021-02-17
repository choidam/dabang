//
//  RoomResponseString.swift
//  dabang
//
//  Created by 최담 on 2021/02/17.
//

import Foundation

// MARK: - RoomResponseString
struct RoomResponseString: Codable {
    let average: [Average]
    let rooms: [Room]
}

// MARK: - Average
struct Average: Codable {
    let monthPrice, name, yearPrice: String
}

// MARK: - Room
struct Room: Codable {
    let desc: String
    let isCheck: Bool
    let priceTitle: String
    let roomType, sellingType: Int
    let hashTags: [String]
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        case desc
        case isCheck = "is_check"
        case priceTitle = "price_title"
        case roomType = "room_type"
        case sellingType = "selling_type"
        case hashTags = "hash_tags"
        case imgURL = "img_url"
    }
}
