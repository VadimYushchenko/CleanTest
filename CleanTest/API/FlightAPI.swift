//
//  FlightAPI.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 24.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import Foundation


struct FlightResponse: Decodable {
    var destination: String
    var airline: String
    var price: Decimal
    var transfers: Int
    var cityName: String?
    
   enum CodingKeys: String, CodingKey {
       case destination
       case airline
       case price
       case transfers
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        destination = try values.decode(String.self, forKey: .destination)
        airline = try values.decode(String.self, forKey: .airline)
        price = try values.decode(Decimal.self, forKey: .price)
        transfers = try values.decode(Int.self, forKey: .transfers)
//        cityName = CityWorker(filename: "cities")
    }
    
}

fileprivate struct RawFlightResponse{
    
}

struct FlightRequest: HTTPRequest {
    var city: String
    
    var baseUrl: String {
        return "https://api.travelpayouts.com/v1/"
    }
    
    var path: String {
        return "city-directions"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        return ["origin":city,
                "currency": "EUR",
        ]
    }
    var header: [String:String]? {
        return ["x-access-token":"aa1214a745e618da41cf5b52cbed40d6"]
    }
    var encoder: ParameterEncoder? {
        return URLEncoder()
    }
}

protocol FlightAPIProtocol {
    func fetch(city: String, completion: @escaping (Result<[FlightResponse], Error>) -> Void)
}


class FlightAPI: FlightAPIProtocol {
    private var network = Network()
    func fetch(city: String, completion: @escaping (Result<[FlightResponse], Error>) -> Void) {
        network.request(FlightRequest(city: city), completion: completion)
        
    }
}
