//
//  MockRequestItem.swift
//  SampleTFT
//
//  Created by Marco Antonio on 15/01/25.
//

import Foundation

struct MockRequestItem: Identifiable {
    let id = UUID()
    var name: String
    var url: String
    var tag: String
}
