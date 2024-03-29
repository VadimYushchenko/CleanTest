//
//  WeatherInteractor.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 24.11.2019.
//  Copyright (c) 2019 Vadim Yushchenko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WeatherBusinessLogic
{
  func getWeather(request: Weather.Get.Request)
}

protocol WeatherDataStore
{
  //var name: String { get set }
}

class WeatherInteractor: WeatherBusinessLogic, WeatherDataStore
{
  var presenter: WeatherPresentationLogic?
  var worker: WeatherWorker?
    var api: WeatherAPIProtocol = WeatherAPI()
  //var name: String = ""
  
  // MARK: Do something
  
  func getWeather(request: Weather.Get.Request)
  {
    worker = WeatherWorker()
    worker?.doSomeWork()
    
    api.getWeather(city: request.city) { (result) in
        switch result {
        case .success(let data):
            let response = Weather.Get.Response(item: data)
            self.presenter?.presentWeather(response: response)
        case .failure(let error):
            print(error)
        }
    }
    
    
  }
}
