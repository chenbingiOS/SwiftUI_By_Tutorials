//
//  BullsEyePlusApp.swift
//  BullsEyePlusWatch Extension
//
//  Created by mtAdmin on 2021/6/1.
//

import SwiftUI

@main
struct BullsEyePlusApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
