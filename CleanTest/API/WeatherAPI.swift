//
//  WeatherAPI.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 25.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import Foundation

enum WeatherRequest {
    case city(name: String)
}

extension WeatherRequest: HTTPRequest {
    
    var encoder: ParameterEncoder? {
        return URLEncoder()
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .city(let name):
            return ["q": name,
                    "units":"metric",
                    "APPID":"5f2fe115f6f5d97b1b5e2ba33ebccaed"]
        }
    }
    
    var baseUrl: String {
        return "https://api.openweathermap.org/data/2.5/"
    }
    
    var path: String {
        return "weather"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}

protocol WeatherAPIProtocol {
    func getWeather(city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}


class WeatherAPI: WeatherAPIProtocol {
    private var network = Network()
    func getWeather(city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        network.request(WeatherRequest.city(name: city), completion: completion)
        
    }
}
