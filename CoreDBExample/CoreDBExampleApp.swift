//
//  CoreDBExampleApp.swift
//  CoreDBExample
//
//  Created by Esat Gözcü on 2023/05/10.
//

import SwiftUI

@main
struct CoreDBExampleApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
