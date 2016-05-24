//
//  SignUp.swift
//  oskrTesis
//
//  Created by otoribios on 22/5/16.
//  Copyright © 2016 Oscar David Toribio Santos. All rights reserved.
//
import Foundation
import Firebase

class SignUp : NSObject {
    
    let rootRef = FIRDatabase.database().reference().child("users")
    
    var firstName: String?
    var lastName: String?
    var userCardID : String?
    var userEmail: String?
    var password: String?
    var confirmPassword: String?
    
    init(fName: String, lName: String, uCardID: String, uEmail: String, password: String, cPassword: String){
        self.firstName = fName
        self.lastName = lName
        self.userCardID = uCardID
        self.userEmail = uEmail
        self.password = password
        self.confirmPassword = cPassword
    }
    
    func signUpTheUser() throws -> Bool{
        guard hasEmptyFields() else {
            throw Error.EmptyField
        }
        
        guard isValidEmail() else {
            throw Error.InvalidEmail
        }
        
        guard validatePasswordMatch() else {
            throw Error.PasswordDoNotMatch
        }
        
        guard storeSuccessfulSignUp() else {
            throw Error.EmailTaken
        }
        
        return true
    }
    
    func hasEmptyFields()-> Bool{
        if !firstName!.isEmpty && !lastName!.isEmpty && !userCardID!.isEmpty && !userEmail!.isEmpty && !password!.isEmpty && !confirmPassword!.isEmpty{
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool{
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = userEmail!.rangeOfString(regEx, options: .RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
    }
    
    func validatePasswordMatch()-> Bool {
        if (password! == confirmPassword!){
            return true
        }
        return false
    }
    
    
    func storeSuccessfulSignUp()-> Bool {
        
        var success =  true
        FIRAuth.auth()?.createUserWithEmail(userEmail!, password: password!) { (user, error) in
            
            if let error = error {
                success = false
                print("Error signup user")
                print(error.localizedDescription)

            } else {
                
                print("User Registred")
                let data = ["firstName": self.firstName!,
                            "lastName": self.lastName!,
                            "userCardID": self.userCardID!,
                            "userEmail": self.userEmail!]
            
                self.rootRef.child(user!.uid).setValue(data)
            }
        }
        
        delay(3.0){
            print("saving in database...")
        }
        print("\(success)")
        return success
    }
    

    func delay(time: Double, closure: () -> () ){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))),dispatch_get_main_queue(),closure)
    }



}
