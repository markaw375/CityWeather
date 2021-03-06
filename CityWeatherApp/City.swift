//
//  City.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 02/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import Foundation
import UIKit

struct City {
    let name: String
    let country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    static func AllCities() -> [City] {
        return [City(name: "Warsaw", country: "Poland"),
                City(name: "Zurych", country: "Switzerland"),
                     City(name: "Barcelona", country: "Spain")]
    }
}

