//
//  EditItemVC.swift
//  MeSeeHero
//
//  Created by X1 on 11/1/19.
//  Copyright © 2019 X1. All rights reserved.
//

import UIKit

protocol EditItemDelegate: class{
    func addedHeroItem()
}
class EditItemVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var namePicker: UIPickerView!
    
    @IBOutlet weak var zodiacSignPicker: UIPickerView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var inputLastLocation: String?
    
    weak var delegate: EditItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLastLocationChange(_ sender: UITextField) {
        if let newValue = sender.text{
          inputLastLocation = newValue
        }
    }
    
  
    @IBAction func onCancel(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        if let title = inputLastLocation, let lastLocation = inputLastLocation{
            CoreDataStack.shared.saveItem(lastLocation: lastLocation, name: Int16(namePicker.selectedRow(inComponent:0)), zodiacSign: Int16(zodiacSignPicker.selectedRow(inComponent: 0)), lastSnapshot: imageView.image as! UIImage)
            delegate?.addedHeroItem()
        }
        presentingViewController?.dismiss(animated:true)
    }
    
    @IBAction func onCameraBtn(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                           message: NSLocalizedString("str_noCamera", comment: ""),
                                           preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("str_ok", comment: ""), style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func onGalleryBtn(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage  {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

}


