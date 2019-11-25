//
//  Network.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 22.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get
    case post
}


protocol HTTPRequest {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var encoder: ParameterEncoder? { get }
    var header: [String:String]? { get }
}

extension HTTPRequest {
    var header: [String : String]? {
           return nil
       }
}

typealias Completion = (_ result: Result<Decodable, Error>) -> Void

protocol NetworkService {
    associatedtype Endpoint = HTTPRequest
    func request<T: Decodable>(_ endpoint: Endpoint,  completion: @escaping (Result<T, Error>) -> Void)
}

protocol ParameterEncoder {
    func encode(_ urlRequest: URLRequest, parameters: [String: Any]?) -> URLRequest
}

struct URLEncoder: ParameterEncoder {
    public func encode(_ urlRequest: URLRequest, parameters: [String: Any]?) -> URLRequest {
           var urlRequest =  urlRequest

           guard let parameters = parameters else { return urlRequest }

                let url = urlRequest.url!

               if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
                   let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
                urlComponents.percentEncodedQuery = percentEncodedQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                   urlRequest.url = urlComponents.url
               }

           return urlRequest
       }
    
    private func query(_ parameters: [String: Any]) -> String {
        var pairs:[(String,String)] = []
        for key in parameters.keys {
            let value = parameters[key]
            pairs += [(key,"\(value!)")]
        }
        return pairs.map{ "\($0)=\($1)" }.joined(separator: "&")
    }
    
}

class FlightDecoder: JSONDecoder {
    
    override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable{
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if let json = json as? [String:Any], let cities = json["data"] as? [String: Any]{
                     var array:[[String:Any]] = []
                     
                     for key in cities.keys {
                         array.append(cities[key] as! [String : Any])
                     }
            let data = try JSONSerialization.data(withJSONObject: array,
                                   options: [])
            return try super.decode(type, from: data)
                 }
        return try super.decode(type, from: data)
    }
}

class Network: NetworkService {
     
    func request<T: Decodable>(_ endpoint: HTTPRequest,  completion: @escaping (Result<T, Error>) -> Void) {
        let session = URLSession.shared
        let request = makeUrl(endpoint)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
             if let result = data {
                do {
                    let decoded = try FlightDecoder().decode(T.self, from: result)
                    DispatchQueue.main.async {
                    completion(.success(decoded))
                    }
                }catch {
                    DispatchQueue.main.async {
                    completion(.failure(error))
                    }
                           }
            }
        }
        dataTask.resume()
    }
    
    private func makeUrl(_ endpoint: HTTPRequest) -> URLRequest {
        let url = URL(string: endpoint.baseUrl + endpoint.path)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = endpoint.header
        request.httpMethod = endpoint.method.rawValue
        request = (endpoint.encoder?.encode(request, parameters: endpoint.parameters))!
        print(request.url?.absoluteString)
        return request
    }
}



