//
//  LittleLemonMenuM4App.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import SwiftUI

@main
struct LittleLemonMenuM4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
