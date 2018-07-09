//
//  ViewController.swift
//  ThongTinBenhNhan
//
//  Created by Minh Mon on 7/2/18.
//  Copyright © 2018 Minh Mon. All rights reserved.
//

import UIKit

class MainController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // Controls
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAltPhone: UITextField!
    @IBOutlet weak var txtNote: UITextView!
    @IBOutlet weak var btnAvatarChoose: UIButton!
    var image = UIImage.init(named: "Identity_Card-512.png")
    
    // Events
    
    @IBAction func test(_ sender: Any) {
        let url = URL.init(string: "\(txtPhone.text)")
        UIApplication.shared.openURL(url!)
    }
    @IBAction func btnSave_Pressed(_ sender: Any) {
        
        saveData()
        
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController.init(title: "Success", message: "Infor Saved", preferredStyle: .alert)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnAvatarChoose_Pressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(image, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButton()
        loadData()
        setAvatar()
        btnAvatarChoose.layer.cornerRadius = btnAvatarChoose.frame.size.width/2
        btnAvatarChoose.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func setAvatar() {
        btnAvatarChoose.setImage(self.image, for: .normal)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true) {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "1998") as! Preview
            destination.image = self.image
            self.present(destination, animated: true, completion: nil)
        }
    }
    
    func addDoneButton() {
        addDoneButtonForTextField(textfield: txtName)
        addDoneButtonForTextField(textfield: txtAddress)
        addDoneButtonForTextField(textfield: txtPhone)
        addDoneButtonForTextField(textfield: txtAltPhone)
        addDoneButtonForTextView(textview: txtNote)
        
    }
    
    func saveData() {
        UserDefaults.standard.setValue(txtName.text, forKey: "NAME")
        UserDefaults.standard.setValue(txtAddress.text, forKey: "ADDRESS")
        UserDefaults.standard.setValue(txtPhone.text, forKey: "PHONE")
        UserDefaults.standard.setValue(txtAltPhone.text, forKey: "ALTPHONE")
        UserDefaults.standard.setValue(txtNote.text, forKey: "NOTE")
    }
    
    func loadData() {
        txtName.text = UserDefaults.standard.string(forKey: "NAME")
        txtAddress.text = UserDefaults.standard.string(forKey: "ADDRESS")
        txtPhone.text = UserDefaults.standard.string(forKey: "PHONE")
        txtAltPhone.text = UserDefaults.standard.string(forKey: "ALTPHONE")
        txtNote.text = UserDefaults.standard.string(forKey: "NOTE")
    }
    
    func addDoneButtonForTextField(textfield: UITextField) {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem.init(title: "DONE", style: UIBarButtonItemStyle.done
                , target: textfield, action: #selector(UITextField.resignFirstResponder))
        ]
        toolbar.sizeToFit()
        textfield.inputAccessoryView = toolbar
    }
    
    func addDoneButtonForTextView(textview: UITextView) {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem.init(title: "Done", style: UIBarButtonItemStyle.done, target: textview, action: #selector(UITextField.resignFirstResponder))
        ]
        toolbar.sizeToFit()
        textview.inputAccessoryView = toolbar
    }

}

