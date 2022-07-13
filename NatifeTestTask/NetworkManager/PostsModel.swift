//
//  PostsModel.swift
//  NatifeTestTask
//
//  Created by Bohdan on 13.07.2022.
//

import Foundation

protocol PostsModelDelegate {
    func postsFetched(_ posts: [Post])
}

struct PostsModel {
    
    var delegate: PostsModelDelegate?
    
    func getPosts() {
        let url = URL(string: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json")
        
        guard url != nil else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error != nil || data == nil {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                if response.posts != nil {
                    self.delegate?.postsFetched(response.posts!)
                }
            } catch {
                
            }
            
        }
        dataTask.resume()
    }
}
