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
    
    @IBOutlet weak var lastLocationTextField: UITextField!
    var inputLastLocation = "empty"
    var inputZodiac: String?
    
    weak var delegate: EditItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePicker.delegate = self
        namePicker.dataSource = self
        zodiacSignPicker.delegate = self
        zodiacSignPicker.dataSource = self
    }
    
    func alertAction(message : String) -> Void {
        let alert = UIAlertController.init(title: NSLocalizedString("", comment: ""), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            
        }))
        self.present(alert, animated: true) {
            
        }
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
        /*
        if let lastLocation = inputLastLocation, let zodiac = HeroType.allZodiacs[zodiacSignPicker.selectedRow(inComponent:0)] as String?, let img = HeroType(rawValue: namePicker.selectedRow(inComponent:0))?.image()?.pngData() as NSData?, let data =  imageView.image?.pngData() as NSData?{
            print(zodiac)
            CoreDataStack.shared.saveItem(lastLocation: lastLocation, name: Int16(namePicker.selectedRow(inComponent:0)), image: img, zodiacSign: zodiac, lastSnapshot: data)
            delegate?.addedHeroItem()
 */
        let lastLocation = inputLastLocation
        if let img = HeroType(rawValue: namePicker.selectedRow(inComponent:0))?.image()?.pngData() as NSData?, let data =  imageView.image?.pngData() as NSData?{
            CoreDataStack.shared.saveItem(lastLocation: lastLocation, name: Int16(namePicker.selectedRow(inComponent:0)), image: img, zodiacSign: Int16(zodiacSignPicker.selectedRow(inComponent:0)), lastSnapshot: data)
            delegate?.addedHeroItem()
        }
        if(lastLocation == "empty"){
           alertAction(message: NSLocalizedString("Cannot be empty", comment: ""))
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
            print("Added")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension EditItemVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return HeroType.allNames.count
        } else {
            return HeroType.allZodiacs.count
        }
    }
}

extension EditItemVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return HeroType(rawValue: row)?.name()
        } else {
            return HeroType.allZodiacs[row]
        }
    }
    /*
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView.tag == 1{
            inputZodiac = HeroType.allZodiacs[row]
        }
        
        else {
            return
        }
    }
 */
}

