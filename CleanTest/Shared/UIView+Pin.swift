//
//  UIView+Pin.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 25.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit

extension UIView {
    
    func pin(to prevView: UIView?) -> [NSLayoutConstraint] {
        guard let superview = self.superview else {
                       return []
                   }
               var constraints: [NSLayoutConstraint] = []
               constraints.append(self.trailingAnchor.constraint(equalTo: superview.trailingAnchor))
               constraints.append(self.leadingAnchor.constraint(equalTo: superview.leadingAnchor))
                   
               if let pView = prevView {
                   constraints.append(self.topAnchor.constraint(equalTo: pView.bottomAnchor))
                   constraints.append(self.heightAnchor.constraint(equalTo: pView.heightAnchor, multiplier: 1))
               }else {
                   constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor))
               }
               
               NSLayoutConstraint.activate(constraints)
               return constraints
    }
}
