//
//  ItemListModel.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/3.
//  Copyright © 2020 Corran. All rights reserved.
//

import Foundation

class ItemListModel: ObservableObject {
    @Published var items: [Item] = []
    
    private var storyIds: [Int] = []
    private var storyCategory: StoryCategory = .top
    private let per = 15
    private let page = 1
    private let APIService = HackerNewsAPI()
    
    func setup() {
        APIService.fetchStoryIds(storyCategory: storyCategory) { ids in
            self.storyIds = ids
            if self.items.count == 0 {
                self.fetchStories()
            }
        }
    }
    
    func fetchStories() {
        let startIndex = (page - 1) * per
        let endIndex = page * per - 1
        let ids = storyIds[startIndex...endIndex]
        APIService.fetchItems(ids: ids) { item in
            self.items.append(item)
        }
    }
}
