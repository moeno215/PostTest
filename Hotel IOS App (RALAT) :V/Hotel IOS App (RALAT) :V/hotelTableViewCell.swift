//
//  hotelTableViewCell.swift
//  Hotel IOS App (RALAT) :V
//
//  Created by Maulana Hasbi on 11/17/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit
class hotelTableViewCell: UITableViewCell {
    @IBOutlet weak var labelrate: UILabel!
    @IBOutlet weak var labelalamat: UILabel!
    @IBOutlet weak var labelNama: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

