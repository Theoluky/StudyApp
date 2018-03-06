//
//  PartyTableViewCell.swift
//  StudyApp
//
//  Created by Christina Knight on 2/28/18.
//  Copyright © 2018 Christina Knight. All rights reserved.
//

import UIKit

class PartyTableViewCell: UITableViewCell {
    
    //Properties
    
    @IBOutlet weak var HostLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
