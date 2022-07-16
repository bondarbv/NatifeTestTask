//
//  NetworkManager.swift
//  NatifeTestTask
//
//  Created by Bohdan on 15.07.2022.
//

import Foundation

class NetworkManager {
    func fetchPosts(completionHandler: @escaping (Posts) -> Void ) {
        guard let url = URL(string: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
                    guard let posts = try? JSONDecoder().decode(Posts.self, from: data) else { return }
                    completionHandler(posts)
                }
            }
        }
        
        dataTask.resume()
    }
    
    func fetchSinglePost(id: Int, completionHandler: @escaping (SinglePost) -> Void ) {
        guard let url = URL(string: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
                    guard let singlePost = try? JSONDecoder().decode(SinglePost.self, from: data) else { return }
                    completionHandler(singlePost)
                }
            }
        }
        
        dataTask.resume()
    }
}
