//
//  HeroTVCell.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//

import UIKit

class HeroTVCell: UITableViewCell {

    @IBOutlet weak var nameImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    

    @IBOutlet weak var zodiacSignLabel: UILabel!
    
    
    @IBOutlet weak var residenceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateImage(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameImageView.image = heroType.image()
        }
    }
    
    func updateName(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameLabel.text = heroType.name()
        }
    }
    /*
    func updateZodiacSign(zodiacSign: Int16){
            zodiacSignLabel.text = HeroType.allZodiacs[Int(zodiacSign)]
    }
    */
    func updateZodiacSign(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameLabel.text = heroType.name()
        }
    }
    
    func updateResidence(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            residenceLabel.text = heroType.residence()
        }
    }

}
