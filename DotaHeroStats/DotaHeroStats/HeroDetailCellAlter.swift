//
//  HeroDetailCellAlter.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class HeroDetailCellAlter: UITableViewCell {

    @IBOutlet weak var alterHero1: UIImageView!
    @IBOutlet weak var ahName1: UILabel!
    @IBOutlet weak var alterHero2: UIImageView!
    @IBOutlet weak var ahName2: UILabel!
    @IBOutlet weak var alterHero3: UIImageView!
    @IBOutlet weak var ahName3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
