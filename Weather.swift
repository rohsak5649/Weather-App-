//
//  Weather.swift
//  Wetherly
//
//  Created by Rohan Sakhare on 26/06/24.
//

import Foundation

struct WeatherResponse : Decodable {
    
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double
}
