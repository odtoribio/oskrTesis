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
        if (FIRAuth.auth()?.currentUser) != nil {
            self.performSegueWithIdentifier("goToApp", sender: self)
        }
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func signInDidTouch(sender: UIButton) {
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!, completion: { (user, error) in
            if user != nil{
                self.performSegueWithIdentifier("goToApp", sender: self)
            } else{
                self.errorLabel.text = "Intentelo nuevamente"
            }
        })
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
