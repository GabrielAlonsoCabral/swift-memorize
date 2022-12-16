//
//  SwiftUIView.swift
//  Memorize
//
//  Created by Gabriel Alonso Cabral on 25/08/22.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem:(Item)-> ItemView
    
    init(_ items:[Item], viewForItem: (Item)->ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
