//
//  PlaceLookupView.swift
//  PlaceLookupDemo
//
//  Created by Mac User on 10/5/23.
//

import SwiftUI

struct PlaceLookupView: View {
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var placeVM = PlaceViewModel()
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    var places = ["Kenya", "Tanzania", "Democratic Republic of Congo", "Everywhere", "East Jabib"]
    
    
    var body: some View {
        NavigationStack {
            List(placeVM.places) { place in
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.title2)
                    Text(place.address)
                        .font(.callout)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText, perform: { text in
                if !text.isEmpty {
                    placeVM.search(text: text, region: locationManager.region)
                } else {
                    placeVM.places = []
                }
            })
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    PlaceLookupView()
        .environmentObject(LocationManager())
}
