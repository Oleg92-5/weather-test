//
//  GetCitiesWeather.swift
//  Weather_
//
//  Created by Олег Рубан on 12.04.2022.
//

import Foundation
import CoreLocation
import UIKit

let networkWeathrManager = NetworkWeathrManager()

func getCitiesWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }
            
            networkWeathrManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}
    
   func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
       CLGeocoder().geocodeAddressString(city) { (placemark, error) in
           completion(placemark?.first?.location?.coordinate, error)
       }
   }

