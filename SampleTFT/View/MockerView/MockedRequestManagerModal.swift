//
//  MockedRequestManagerModal.swift
//  SampleTFT
//
//  Created by Marco Antonio on 15/01/25.
//

import SwiftUI

struct MockedRequestManagerModalView: View {
    @StateObject private var viewModel: MockedRequestManagerViewModel

    init(isPresented: Binding<Bool>, items: Binding<[MockRequestItem]>, tags: [String], editingItem: MockRequestItem? = nil) {
        _viewModel = StateObject(wrappedValue: MockedRequestManagerViewModel(
            isPresented: isPresented,
            items: items,
            tags: tags,
            editingItem: editingItem
        ))
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Information")) {
                    TextField("Name", text: $viewModel.name)
                        .autocapitalization(.none)
                    TextField("URL", text: $viewModel.url)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                    Picker("Tag", selection: $viewModel.tag) {
                        ForEach(viewModel.tags, id: \ .self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle(viewModel.editingItem == nil ? "Add Item" : "Edit Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        viewModel.isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(viewModel.editingItem == nil ? "Save" : "Update") {
                        viewModel.handleSaveOrUpdate()
                    }
                }
            }
        }
    }
}
