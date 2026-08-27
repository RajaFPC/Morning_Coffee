//
//  Morning_CoffeeApp.swift
//  Morning_Coffee
//
//  Created by Raja Abhishek Lagadapati on 8/27/26.
//

import SwiftUI

@main
struct Morning_CoffeeApp: App {
    @State private var coffeeManager = CoffeeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coffeeManager)
        }
    }
}
