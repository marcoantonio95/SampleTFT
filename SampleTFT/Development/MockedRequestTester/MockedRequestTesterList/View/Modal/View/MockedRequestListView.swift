//
//  MockedRequestListView.swift
//  SampleTFT
//
//  Created by Marco Antonio on 15/01/25.
//
	
import SwiftUI

struct MockedRequestListView: View {
    @State private var items: [MockRequestItem] = [
        MockRequestItem(name: "Get User Info", url: "https://api.example.com/user/info", tag: "GET"),
        MockRequestItem(name: "Create Post", url: "https://api.example.com/posts/create", tag: "POST"),
        MockRequestItem(name: "Update User Info", url: "https://api.example.com/user/update", tag: "PATCH")
    ]
    @State private var isShowingManagerModal = false
    @State private var editingItem: MockRequestItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(item.tag) - \(item.name)")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(item.url)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(nil)
                    }
                    .padding(.vertical, 8)
                    .swipeActions(edge: .leading) {
                        Button("Edit") {
                            editingItem = item
                        }
                        .tint(.blue)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("REQUESTS")
            .navigationBarItems(trailing:
                 Image(systemName: "plus")
                .font(.body)
                .scaledToFit()
                .foregroundColor(.black)
                .onTapGesture {
                    isShowingManagerModal = true
                }
            )
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowingManagerModal) {
                MockedRequestManagerModal(
                    isPresented: $isShowingManagerModal,
                    items: $items,
                    tags: RequestMethodTag.allCases.map { $0.rawValue }
                )
            }
            .sheet(item: $editingItem) { item in
                MockedRequestManagerModal(
                    isPresented: .constant(true),
                    items: $items,
                    tags: RequestMethodTag.allCases.map { $0.rawValue },
                    editingItem: item
                )
            }
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        MockedRequestListView()
    }
}
