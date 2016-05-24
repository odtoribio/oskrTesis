//
//  SignInViewController.swift
//  oskrTesis
//
//  Created by otoribios on 21/5/16.
//  Copyright © 2016 Oscar David Toribio Santos. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if (FIRAuth.auth()?.currentUser) != nil {
            self.performSegueWithIdentifier("goToMainMenu", sender: self)
        }
    }
    
    @IBAction func signInDidTouch(sender: UIButton) {
        

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
