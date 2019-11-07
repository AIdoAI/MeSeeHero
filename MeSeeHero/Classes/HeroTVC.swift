//
//  HeroTVC.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//

import UIKit
import CoreData

class HeroTVC: UITableViewController, EditItemDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreDataStack.shared.update()
        
        // It is necessary to do this here because of a bug in storyboard editor
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "EditItemSegue":
            if let vc = segue.destination as? EditItemVC {
                vc.delegate = self
            }
        case "DetailViewSegue":
            if let vc = segue.destination as? DetailVC {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.item = CoreDataStack.shared.items[indexPath.row] as? Item
                }
            }
        default:
            fatalError("Invalid segue identifier")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataStack.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTVCell") as? HeroTVCell else {
            fatalError("Expected HeroTVCell")
        }
        
        if let item = CoreDataStack.shared.items[indexPath.row] as? Item {
          //  print(HeroType.allZodiacs[Int(item.zoodiacSign)])
            cell.updateName(name: item.name)
            cell.updateResidence(name: item.name)
            cell.updateZodiacSign(zodiac: item.zodiacSign)
            cell.updateImage(name: item.name)
        }
        
        return cell
    }
    
    // disallow swipe deletion when not in edit mode
    #if !DEBUG
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? .delete : .none
    }
    #endif
    
    func deletionAlert(name: Int16, completion: @escaping (UIAlertAction) -> Void) {
        let heroType = HeroType(rawValue: Int(name))
        let str = heroType?.name()
          
        let alertMsg = "Are you sure you want to delete \(String(describing: str))? This cannot be undone!"
        let alert = UIAlertController(title: "Warning", message: alertMsg, preferredStyle: .actionSheet)
 
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = CoreDataStack.shared.items[indexPath.row] as? Item {
                deletionAlert(name: item.name) { _ in
                    CoreDataStack.shared.deleteItem(item: item)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    func addedHeroItem(){
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func onToggleEditing(_ sender: UIBarButtonItem) {
        setEditing(!isEditing, animated: true)
    }
    
}
