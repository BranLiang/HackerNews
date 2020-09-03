//
//  HackerNewsAPI.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/3.
//  Copyright © 2020 Corran. All rights reserved.
//

import Foundation
import Combine

struct HackerNewsAPI {
    let baseUrl = "https://hacker-news.firebaseio.com/v0"
    
    private func fetchItem(id: Int, onComplete: @escaping (Item) -> ()) {
        let url = URL(string: "\(baseUrl)/item/\(id).json")
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            do {
                let item = try JSONDecoder().decode(Item.self, from: data!)
                DispatchQueue.main.async {
                    onComplete(item)
                }
            } catch {
                print("Unexpected error: \(error).")
                print(data!)
            }
        }
        .resume()
    }
    
    func fetchItems(ids: ArraySlice<Int>, onReceive: @escaping (Item) -> ()) {
        for id in ids {
            fetchItem(id: id, onComplete: onReceive)
        }
    }
    
    func fetchStoryIds(storyCategory: StoryCategory, onComplete: @escaping ([Int]) -> ()) {
        let url = URL(string: "\(baseUrl)/\(storyCategory)stories.json")
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            let ids = try! JSONDecoder().decode([Int].self, from: data!)
            onComplete(ids)
        }
        .resume()
    }
}

enum StoryCategory: String {
    case top
    case new
    case best
    case ask
    case show
    case job
}
