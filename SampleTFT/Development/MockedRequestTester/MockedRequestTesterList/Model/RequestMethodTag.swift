//
//  RequestMethodTag.swift
//  SampleTFT
//
//  Created by Marco Antonio on 15/01/25.
//

import Foundation

enum RequestMethodTag: String, CaseIterable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
