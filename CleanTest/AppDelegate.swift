//
//  AppDelegate.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 22.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit
/*
struct User: Codable{
    var id: Int
    var name: String
    var username: String
    var email: String
}

enum UserEndpoint {
    case all
//    var id: Int
}

extension UserEndpoint: Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var parametrs: Parameters? {
        return nil
    }
    
    var path: String {
        return "/users"
    }
    var decoder: AnyResponseDecoding<JSONDecoding<[User]>> {
        return AnyResponseDecoding(JSONDecoding<[User]>())
    }
    
}

extension User: CustomStringConvertible {
    var description: String {
        return "(id:\(id), name:\(name), username:\(username))\n"
    }
}
*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        let fvc = FlightViewController(nibName: nil, bundle: nil)
////
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateInitialViewController()
//       
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
//        Network().request(WeatherEndpoint.city(name: "London")) { ( result: Result<WeatherResponse, Error>) in
//            switch result {
//
//            case .success( let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

