//
//  GrassDoor_TestApp.swift
//  GrassDoor_Test
//
//  Created by Rameshwar Gupta on 16/07/22.
//

import SwiftUI

@main
struct GrassDoor_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
