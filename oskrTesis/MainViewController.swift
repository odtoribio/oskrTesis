//
//  MainViewController.swift
//  oskrTesis
//
//  Created by otoribios on 20/5/16.
//  Copyright © 2016 Oscar David Toribio Santos. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    let rootRef = FIRDatabase.database().reference().child("condition")
    
//    @IBOutlet weak var textLabel: UILabel!
//    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let _ = user {
                // User is signed in.
            } else {
                self.performSegueWithIdentifier("goSignIn", sender: self)
            }
        }
    }
    
    @IBAction func logOutUser(sender: UIButton) {
        do {
            try FIRAuth.auth()?.signOut()
            print("heloooooooo")
            self.performSegueWithIdentifier("goSignIn", sender: self)
        } catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
    }

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.rootRef.setValue(["name":"oscar"])
        //self.ref.setValue(["users":"oscar"])
}

//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        rootRef.observeEventType(.Value){
//            (snap: FIRDataSnapshot) in
//            self.textLabel.text = snap.value?.description
//        }
//    }
//    
//    @IBAction func sunnyDidTouch(sender: AnyObject) {
//        rootRef.setValue("Sunny")
//    }
//
//    @IBAction func foggyDidTouch(sender: AnyObject) {
//        rootRef.setValue("Foggy")
//    }


