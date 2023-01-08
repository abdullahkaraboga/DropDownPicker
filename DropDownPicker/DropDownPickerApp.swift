//
//  DropDownPickerApp.swift
//  DropDownPicker
//
//  Created by Abdullah Karaboğa on 8.01.2023.
//

import SwiftUI

@main
struct DropDownPickerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
