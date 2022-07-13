//
//  Response.swift
//  NatifeTestTask
//
//  Created by Bohdan on 13.07.2022.
//

import Foundation

struct Response: Decodable {
    
    var posts:[Post]?
    
    enum CodingKeys: String, CodingKey {
        case posts
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posts = try container.decode([Post].self, forKey: .posts)
    }
}
