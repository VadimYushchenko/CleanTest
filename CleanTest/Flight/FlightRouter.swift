//
//  FlightRouter.swift
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

@objc protocol FlightRoutingLogic
{
  func routeToCityList(segue: UIStoryboardSegue?)
}

protocol FlightDataPassing
{
  var dataStore: FlightDataStore? { get }
}

class FlightRouter: NSObject, FlightRoutingLogic, FlightDataPassing
{
  weak var viewController: FlightViewController?
  var dataStore: FlightDataStore?
  
  // MARK: Routing
  
  func routeToCityList(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
//      let destinationVC = segue.destination as! SomewhereViewController
//      var destinationDS = destinationVC.router!.dataStore!
//      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    } else {
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
        let destinationVC = CityListViewController(nibName: nil, bundle: nil)
//            viewController?.parent as! ContainerViewController
      var destinationDS = destinationVC.router!.dataStore!
//      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation
  
  func navigateToSomewhere(source: FlightViewController, destination: UIViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
//  func passDataToSomewhere(source: FlightDataStore, destination: inout SomewhereDataStore)
//  {
//    destination.name = source.name
//  }
}
