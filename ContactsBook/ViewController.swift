//
//  ViewController.swift
//  ContactsBook
//
//  Created by Admin on 15/08/17.
//  Copyright © 2017 fis. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController , CNContactPickerDelegate{

    @IBOutlet weak var contactDetailsLAbel: UILabel!
    var contacts: [CNContact] = []
    var contactDetails = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()

        contacts = {
            let contactStore = CNContactStore()
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactImageDataAvailableKey,
                CNContactThumbnailImageDataKey] as [Any]
            
            // Get all the containers
            var allContainers: [CNContainer] = []
            do {
                allContainers = try contactStore.containers(matching: nil)
            } catch {
                print("Error fetching containers")
            }
            
            var results: [CNContact] = []
            
            // Iterate all containers and append their contacts to our results array
            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
                
                do {
                    let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                    results.append(contentsOf: containerResults)
                } catch {
                    print("Error fetching results for container")
                }
            }
            
            return results
        }()
        print(contacts)
       
        for contact in contacts {
            let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
            let phoneNumber = ((((contact.phoneNumbers[0] as AnyObject).value(forKey: "labelValuePair")as AnyObject).value(forKey: "value")as AnyObject).value(forKey: "stringValue"))
            let emailAddress = (((contact.emailAddresses as AnyObject).value(forKey: "labelValuePair")as AnyObject).value(forKey: "value"))
            
            let contactsDict = ["fullName":"\(fullName)","phoneNumber":"\(phoneNumber!)","emailAddress":"\(emailAddress!)"]
            self.contactDetails.append(contactsDict)
            
        }
        print(contactDetails)
        
    }

    // Mark: - contacts load on selection basis
    
    @IBAction func loadContactPressed(_ sender: Any) {
    
//        let entityType = CNEntityType.contacts
//        let authStatus = CNContactStore.authorizationStatus(for: entityType)
//        if authStatus == CNAuthorizationStatus.notDetermined{
//            
//            let contactStore = CNContactStore.init()
//            contactStore.requestAccess(for: entityType, completionHandler: { (success, nil) in
//                if success{
//                    self.openContacts()
//                }
//                else{
//                    print("not authorized")
//                }
//            })
//            
//        }else if authStatus == CNAuthorizationStatus.authorized{
//        
//                self.openContacts()
//            
//        }
    }
//
//    func openContacts(){
//    
//        let contactPicker = CNContactPickerViewController.init()
//        contactPicker.delegate = self as CNContactPickerDelegate
//        self.present(contactPicker, animated: true, completion: nil)
//        
//        
//    }
//    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//        
//        let fullName = "\(contact.givenName)\(contact.familyName)"
//        var email = "Not Available"
//        if !contact.emailAddresses.isEmpty{
//            let emailString = (((contact.emailAddresses[0] as AnyObject).value(forKey: "labelValuePair")as AnyObject).value(forKey: "value"))
//            email = emailString! as! String
//        }
//        var phoneNumber = "Not Available"
//        
//        let phoneString = ((((contact.phoneNumbers[0] as AnyObject).value(forKey: "labelValuePair")as AnyObject).value(forKey: "value")as AnyObject).value(forKey: "stringValue"))
//        phoneNumber = phoneString! as! String
//        
//        self.contactDetailsLAbel.text = "Name:\(fullName)\nEmail:\(email)\nPhoneNo:\(phoneNumber)"
//        
//    }
    
    
    
    
    
    
    
    
    
    
    
}










