//
//  CoreDataStack.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class CoreDataStack: NSObject {
    
    static let shared = CoreDataStack()
    
    let modelName = "MeSeeHero"
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MeSeeHero")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var items: [NSManagedObject] = []
    
    // MARK: - Core Data operations
    
    func update() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        do {
            items = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
    }
    
    func saveItem(lastLocation: String, name: Int16, zodiacSign: Int16, lastSnapshot: UIImage) {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Item", in: context) {
            let item = NSManagedObject(entity: entity, insertInto: context)
            item.setValue(lastLocation, forKeyPath: "lastLocation")
            item.setValue(name, forKeyPath: "name")
            item.setValue(zodiacSign, forKey: "zodiacSign")
            item.setValue(lastSnapshot, forKeyPath: "lastSnapshot")
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the item. \(error), \(error.userInfo)")
            }
        }
        update()
    }
    
    func deleteItem(item: Item) {
        if let _ = items.firstIndex(of: item)  {
            context.delete(item)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        update()
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
