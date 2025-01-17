//
//  MockedRequestManagerViewModel.swift
//  SampleTFT
//
//  Created by Marco Antonio on 16/01/25.
//

import SwiftUI

class MockedRequestManagerViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var url: String = ""
    @Published var tag: String = ""
    @Binding var items: [MockRequestItem]
    @Binding var isPresented: Bool

    let tags: [String]
    let editingItem: MockRequestItem?

    init(isPresented: Binding<Bool>, items: Binding<[MockRequestItem]>, tags: [String], editingItem: MockRequestItem? = nil) {
        _isPresented = isPresented
        _items = items
        self.tags = tags
        self.editingItem = editingItem

        if let item = editingItem {
            name = item.name
            url = item.url
            tag = item.tag
        }
    }

    func handleSaveOrUpdate() {
        guard !name.isEmpty, !url.isEmpty, !tag.isEmpty else { return }
        
        if let editingItem = editingItem,
           let index = items.firstIndex(where: { $0.id == editingItem.id }) {
            items[index] = MockRequestItem(name: name, url: url, tag: tag)
        } else {
            let newItem = MockRequestItem(name: name, url: url, tag: tag)
            items.append(newItem)
        }
        isPresented = false
    }
}
