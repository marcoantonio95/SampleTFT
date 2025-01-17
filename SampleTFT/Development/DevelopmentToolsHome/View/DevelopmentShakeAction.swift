//
//  DevelopmentShakeAction.swift
//  SampleTFT
//
//  Created by Marco Antonio on 17/01/25.
//

import SwiftUI

private class DevelopmentShakeWindow: UIWindow {
    var onShakeDetected: (() -> Void)?

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            onShakeDetected?()
        }
        super.motionEnded(motion, with: event)
    }
}

internal class DevelopmentShakeSceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        #if DEBUG
        if let windowScene = scene as? UIWindowScene {
            let window = DevelopmentShakeWindow(windowScene: windowScene)
            let contentView = ContentView()
            window.rootViewController = UIHostingController(rootView: contentView)
            window.makeKeyAndVisible()
            self.window = window

            window.onShakeDetected = {
                if let rootVC = window.rootViewController {
                    let debugView = UIHostingController(rootView: DevelopmentToolsHomeView())
                    debugView.modalPresentationStyle = .overFullScreen
                    rootVC.present(debugView, animated: true)
                }
            }
        }
        #endif
    }
}
