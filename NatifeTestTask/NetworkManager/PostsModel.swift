//
//  PostsModel.swift
//  NatifeTestTask
//
//  Created by Bohdan on 16.07.2022.
//

import Foundation

struct PostsModel: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let postID, timeshamp, likesCount: Int
    let title, previewText: String
    
    enum CodingKeys: String, CodingKey {
        case timeshamp, title
        case postID = "postId"
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
