//
//  ItemRow.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/3.
//  Copyright © 2020 Corran. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.subheadline)
            Text("\(item.score) points by \(item.by)")
                .font(.caption)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let testItem = Item(
            id: 1,
            type: .story,
            by: "Bran Liang",
            time: Date(timeIntervalSince1970: 1599054458),
            title: "Kubernetes: Make your services faster by removing CPU limits",
            url: URL(string: "https://erickhun.com/posts/kubernetes-faster-services-no-cpu-limits/")!,
            score: 27
        )
        return ItemRow(item: testItem)
    }
}
