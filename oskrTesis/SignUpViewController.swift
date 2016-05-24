//
//  SignUpViewController.swift
//  oskrTesis
//
//  Created by otoribios on 21/5/16.
//  Copyright © 2016 Oscar David Toribio Santos. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {

    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userCardID: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.delegate = self
        lastName.delegate = self
        userCardID.delegate = self
        userEmail.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
    }
    
    
    @IBAction func signUpDidTouch(sender: UIButton) {
        errorLabel.text = ""
        let signup = SignUp(fName: firstName.text!, lName: lastName.text!, uCardID: userCardID.text!, uEmail: userEmail.text!, password: password.text!, cPassword: confirmPassword.text!)
        
        do {
            
            try signup.signUpTheUser()
            let alert = signUpSuccessAlert()
            presentViewController(alert, animated: true, completion: nil)
            
        } catch let error as Error {
            
            errorLabel.text = error.description
            
        } catch { errorLabel.text = "Algo salio mal, porfavor intente denuevo"
        
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func signUpSuccessAlert() -> UIAlertController {
        
        let alertview = UIAlertController(title: "Registrado Correctamente", message: "Ahora puede iniciar sesion", preferredStyle: .Alert)
        
        alertview.addAction(UIAlertAction(title: "Iniciar Sesion", style: .Default, handler: { (alertAction) -> Void in self.dismissViewControllerAnimated(true, completion: nil)}))
        alertview.addAction(UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil))
        
        return alertview
    }
    
}
