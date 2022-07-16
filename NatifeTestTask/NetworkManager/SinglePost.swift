//
//  SinglePost.swift
//  NatifeTestTask
//
//  Created by Bohdan on 16.07.2022.
//

import Foundation

struct SinglePost: Codable {
    let post: Single
}

struct Single: Codable {
    let postID, timeshamp: Int
    let title, text: String
    let postImage: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title, text, postImage
        case likesCount = "likes_count"
    }
}
