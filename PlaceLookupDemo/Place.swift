//
//  Place.swift
//  PlaceLookupDemo
//
//  Created by Mac User on 10/5/23.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID().uuidString
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem){
        self.mapItem = mapItem
    }
    
    var name: String {
        self.mapItem.name ?? ""
    }
    
    var address: String {
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var address = ""
        
        cityAndState = placemark.locality ?? "" // city
        
        if let state = placemark.administrativeArea {
            // show either state or city, state if we have both
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state)"
        }
        address = placemark.subThoroughfare ?? "" // address #
        
        if let street = placemark.thoroughfare {
            // just show the street unless there is a street # then space + street
            address = address.isEmpty ? street : "\(address) , \(street)"
        }
        
        if address.trimmingCharacters(in: .whitespaces) .isEmpty && !cityAndState.isEmpty {
            // No address? then just city and state with no space
            address = cityAndState
        } else {
            // No cityandstate? then just address, otherwise address, cityAndState
            address = cityAndState.isEmpty ? address : "\(address), \(cityAndState)"
        }
        
        return address
    }
    
    var latitude: CLLocationDegrees{
        self.mapItem.placemark.coordinate.latitude
    }
    var longitude: CLLocationDegrees{
        self.mapItem.placemark.coordinate.longitude
    }
}
