//
//  SampleTFTApp.swift
//  SampleTFT
//
//  Created by Marco Antonio on 09/01/25.
//

import SwiftUI
import SwiftData

@main
struct SampleTFTApp: App {
    #if DEBUG
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
