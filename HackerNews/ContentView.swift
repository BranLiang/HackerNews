//
//  ContentView.swift
//  HackerNews
//
//  Created by BranLiang on 2020/9/2.
//  Copyright © 2020 Corran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var itemListModel: ItemListModel
    var body: some View {
        ItemList(items: self.itemListModel.items)
            .onAppear {
                self.itemListModel.setup()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
