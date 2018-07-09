//
//  Preview.swift
//  ThongTinBenhNhan
//
//  Created by Minh Mon on 7/6/18.
//  Copyright © 2018 Minh Mon. All rights reserved.
//

import UIKit

class Preview: UIViewController {
    
    // Controls
    @IBOutlet weak var imgPreview: UIImageView!
    var image: UIImage?
    
    // Events
    
    @IBAction func btnSetAvatar_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBToA", sender: self)
    }
    
    @IBAction func btnCancel_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Main
    
    override func viewDidLoad() {
        imgPreview.image = self.image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueBToA") {
            let destination = segue.destination as! MainController
            destination.image = self.image
        }
    }
    
}
