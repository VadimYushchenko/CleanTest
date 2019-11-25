//
//  ViewController.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 22.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let containerVC = children.first as? ContainerViewController {
            let fvc = FlightViewController(nibName: nil, bundle: nil)
            let fvc2 = FlightViewController(nibName: nil, bundle: nil)
            containerVC.addChild(fvc)
            
            if let wvc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController{
                fvc.delegate = wvc
            containerVC.addChild(wvc)
        }
        }
    }


}

