//
//  Item+CoreDataProperties.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//

import Foundation
import CoreData
import UIKit


extension Item {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
    
    @NSManaged public var name: Int16
    @NSManaged public var residence: String?
    @NSManaged public var zoodiacSign: Int16
    @NSManaged public var uuid: UUID?
    @NSManaged public var image: NSData?
    @NSManaged public var lastSnapshot: NSData?
    @NSManaged public var lastLocation: String?
    
    
}
