//
//  Post.swift
//  NatifeTestTask
//
//  Created by Bohdan on 13.07.2022.
//

import Foundation

struct Post: Codable {
    let title: String?
    let previewText: String?
    let postID: Int?
    let timeshamp: Int?
    let likesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case timeshamp, title
        case postID = "postId"
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.previewText = try container.decode(String.self, forKey: .previewText)
        self.postID = try container.decode(Int.self, forKey: .postID)
        self.timeshamp = try container.decode(Int.self, forKey: .timeshamp)
        self.likesCount = try container.decode(Int.self, forKey: .likesCount)
    }
}
