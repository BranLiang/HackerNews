//
//  Item.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/2.
//  Copyright © 2020 Corran. All rights reserved.
//

import Foundation

enum ItemType {
    case job
    case story
    case comment
    case poll
    case pollopt
}

struct Item: Identifiable {
    var id: Int
    var type: ItemType
    var by: String
    var time: Date
    var title: String
    var url: String
    var score: Int
}
