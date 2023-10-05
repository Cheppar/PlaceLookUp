//
//  PlaceLookupDemoApp.swift
//  PlaceLookupDemo
//
//  Created by Mac User on 10/5/23.
//

import SwiftUI

@main
struct PlaceLookupDemoApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
