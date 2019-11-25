//
//  WeatherResponse.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 22.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit

struct Temperatur {
    
}

struct WeatherResponse: Decodable {
    var city: String
    var temperature: Float
    var cloudiness: String
    var description: String
    var windSpeed: Float
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
    }
    
    init(from decoder: Decoder) throws {
        let raw = try RawResponse(from: decoder)
        temperature = raw.main.temp
        cloudiness = raw.weather.first?.main ?? ""
        description = raw.weather.first?.description ?? ""
        city = raw.name
        windSpeed = raw.wind.speed
    }
}


fileprivate struct RawResponse: Decodable {
    var main: Main
    var weather: [Weather]
    var name: String
    var wind: Wind
    
    struct Main: Decodable {
        var temp: Float
    }
    
    struct Weather: Decodable {
        var main: String
        var description: String
    }
    
    struct Wind: Decodable {
        var speed: Float
    }
}
