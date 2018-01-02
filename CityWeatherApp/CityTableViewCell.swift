//
//  CityTableViewCell.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 02/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
