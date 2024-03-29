//
//  CityListModels.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 22.11.2019.
//  Copyright (c) 2019 Vadim Yushchenko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum CityList
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var items: [City]
    }
    struct ViewModel
    {
        var items: [City]
    }
  }
}
