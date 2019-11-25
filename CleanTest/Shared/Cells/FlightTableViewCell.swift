//
//  FlightTableViewCell.swift
//  CleanTest
//
//  Created by Vadim Yushchenko on 25.11.2019.
//  Copyright © 2019 Vadim Yushchenko. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {

    @IBOutlet weak var airline: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var transfer: UILabel!
    @IBOutlet weak var city: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
