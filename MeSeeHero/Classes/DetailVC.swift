//
//  DetailVC.swift
//  MeSeeHero
//
//  Created by X1 on 11/2/19.
//  Copyright © 2019 X1. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var lastLocationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item?.lastSeenLocation
        lastLocationLabel.text = item?.lastSeenLocation
        if let name = item?.name{
            updateName(type: name)
            updateImage(type: name)
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    func updateImage(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            imageView.image = heroType.image()
        }
    }
    
    func updateName(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameLabel.text = heroType.name()
        }
    }
    

    
    


}
