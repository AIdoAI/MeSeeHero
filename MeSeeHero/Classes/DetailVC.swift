//
//  DetailVC.swift
//  MeSeeHero
//
//  Created by X1 on 11/2/19.
//  Copyright © 2019 X1. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var residenceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item?.lastLocation
        residenceLabel.text = item?.residence
        if let name = item?.name, let data = item?.lastSnapshot{
            updateName(type: name)
            updateSnapshot(type: data)
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    func updateSnapshot(type: NSData){
        imageView.image = UIImage(data: type as Data)
    }
    
    func updateName(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameLabel.text = heroType.name()
        }
    }
    

    
    


}
