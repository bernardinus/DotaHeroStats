//
//  HeroDetailCellAttribute.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class HeroDetailCellAttribute: UITableViewCell {

    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var value: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
