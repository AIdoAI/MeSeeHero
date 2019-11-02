//
//  Item+CoreDataClass.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//
import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    override public func awakeFromInsert() {
        if self.uuid == nil {
            self.uuid = UUID()
        }
    }
    
}
