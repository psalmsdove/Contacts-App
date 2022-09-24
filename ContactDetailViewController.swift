//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Furkan Sabaz on 16.01.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit


protocol ContactDetailControllerDelegate {
    func markAsFavoriteContact(contact : Contact)
}

class ContactDetailViewController: UITableViewController {

    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    @IBOutlet weak var btnMarkAsFavorite: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    
    var delegate : ContactDetailControllerDelegate?
    
    var contact : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        applyView()
    }
    
    
    func applyView() {
        
        
        guard let contact = contact  else { return }
        
        lblPhoneNumber.text = contact.phone
        lblEmail.text = contact.email
        lblCity.text = contact.city
        lblState.text = contact.state
        lblZipCode.text = contact.zip
        lblStreet.text = contact.street
        
        
        imgProfile.image = contact.image
        lblName.text = "\(contact.firstName) \(contact.lastName)"
        
        
        if contact.favorite {
            btnMarkAsFavorite.setTitle("Remove From Favorites", for: UIControl.State.normal)
        } else {
            btnMarkAsFavorite.setTitle("Mark As Favorite Contact", for: UIControl.State.normal)
        }
        
    }

   
    @IBAction func btnMarkFavoriteClicked(_ sender: UIButton) {
        
        guard let contact  = contact else {return}
        self.contact?.favorite = !contact.favorite
        if (self.contact?.favorite)! {
            btnMarkAsFavorite.setTitle("Remove From Favorites", for: UIControl.State.normal)
        } else {
            btnMarkAsFavorite.setTitle("Mark As Favorite Contact", for: UIControl.State.normal)
        }
        
        
        delegate?.markAsFavoriteContact(contact: self.contact!)
        
    }
    
}
