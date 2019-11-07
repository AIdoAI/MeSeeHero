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
    
    
    @IBOutlet weak var nameImage: UIImageView!
    
    var item: Item?
    
    let nameViewWidth = CGFloat(50)
    let nameViewHeight = CGFloat(50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item?.lastLocation
        residenceLabel.text = item?.residence
        if let name = item?.name, let data = item?.lastSnapshot, let nameData = item?.image{
            updateName(type: name)
            updateSnapshot(type: data)
            updateNameImage(type: nameData)
            //let maxX = imageView.frame.maxX-nameViewWidth
            //let maxY = imageView.frame.maxY-nameViewHeight
            let viewW = imageView.bounds.width
            let viewH = imageView.bounds.height
            let randomX = CGFloat(arc4random_uniform(UInt32(viewW)))
            let randomY = CGFloat(arc4random_uniform(UInt32(viewH)))
            nameImage.contentMode = .scaleAspectFill
            nameImage.center.x = randomX/4 + nameViewWidth/2
            nameImage.center.y = randomY/4 + nameViewHeight/2
            
            nameImage.frame = CGRect.init(
                x: CGFloat(randomX),
                y: CGFloat(randomY),
                width: nameViewWidth,
                height: nameViewHeight
            )
            
            imageView.addSubview(nameImage)
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    func updateSnapshot(type: NSData){
        imageView.image = UIImage(data: type as Data)
    }
    
    func updateNameImage(type: NSData){
        nameImage.image = UIImage(data: type as Data)
    }
    
    
    func updateName(type: Int16){
        if let heroType = HeroType(rawValue: Int(type)){
            nameLabel.text = heroType.name()
        }
    }

}
