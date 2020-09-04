//
//  ItemList.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/3.
//  Copyright © 2020 Corran. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    var items: [Item]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(
                        destination: WebView(url: item.url!)
                            .edgesIgnoringSafeArea(.top)
                            .navigationBarTitle("", displayMode: .inline)
                    ) {
                        ItemRow(item: item)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            Item(
                id: 1,
                type: .story,
                by: "Bran Liang",
                time: Date(timeIntervalSince1970: 1599054458),
                title: "Kubernetes: Make your services faster by removing CPU limits",
                url: URL(string: "https://erickhun.com/posts/kubernetes-faster-services-no-cpu-limits/"),
                score: 27
            ),
            Item(
                id: 2,
                type: .story,
                by: "Alex",
                time: Date(timeIntervalSince1970: 1599044458),
                title: "Handcalcs: Automatically render Latex equations from Python math code",
                url: URL(string: "https://github.com/connorferster/handcalcs"),
                score: 245
            )
        ]
        return ItemList(items: items)
    }
}
