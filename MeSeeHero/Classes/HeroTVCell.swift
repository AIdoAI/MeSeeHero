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
    
    func updateImage(name: Int16){
        if let heroType = HeroType(rawValue: Int(name)){
            nameImageView.image = heroType.image()
        }
    }
    
    func updateName(name: Int16){
        if let heroType = HeroType(rawValue: Int(name)){
            nameLabel.text = heroType.name()
           // print(HeroType.allZodiacs[Int(type)])
        }
    }
    
    func updateZodiacSign(zodiac: Int16){
        if let zodiacType = ZodiacType(rawValue: Int(zodiac)){
            zodiacSignLabel.text = zodiacType.zodiac()
    }
    }
    
    /*
    func updateZodiacSign(zodiac: Int16){
        if let heroType = HeroType(rawValue: Int(name)){
            zodiacSignLabel.text = heroType.name()
        }
    }
 */
    
    func updateResidence(name: Int16){
        if let heroType = HeroType(rawValue: Int(name)){
            residenceLabel.text = heroType.residence()
        }
    }

}
