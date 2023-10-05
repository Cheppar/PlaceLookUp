//
//  ContentView.swift
//  PlaceLookupDemo
//
//  Created by Mac User on 10/5/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var showPlaceLookupSheet = false
    @State var returnedPlace = Place(mapItem: MKMapItem())
    
    var body: some View {
     NavigationStack{
        VStack {
            Text("Location:\n\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0) ")
                .padding(.bottom)
            
            Text("Returned Place: \nName: \(returnedPlace.name)\n\(returnedPlace.address)\nCoordinates: \(returnedPlace.longitude), \(returnedPlace.latitude)")
        }
        .padding()
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                Button{
                    showPlaceLookupSheet.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                    Text("Search Place")
                    }
                }
            }
        }
     .fullScreenCover(isPresented: $showPlaceLookupSheet) {
         PlaceLookupView(returnedPlace: $returnedPlace)
         
     }
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
