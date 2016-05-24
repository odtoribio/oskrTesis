//
//  Enums.swift
//  oskrTesis
//
//  Created by otoribios on 22/5/16.
//  Copyright © 2016 Oscar David Toribio Santos. All rights reserved.
//


enum Error: ErrorType {
    case EmptyField
    case PasswordDoNotMatch
    case InvalidEmail
    case UserCardIDTaken
    case IncorrectSignIn
    case InvalidPassword
    case EmailTaken
}

extension Error: CustomStringConvertible{
    var description : String {
        switch self{
        case .EmptyField: return "Porfavor llene todos los campos"
        case .PasswordDoNotMatch: return "La contraseña no coincide"
        case .InvalidEmail: return "Porfavor entre un email valido"
        case .UserCardIDTaken: return "La Cedula ya existe"
        case .IncorrectSignIn: return "Email o Contraseña son incorrectos"
        case .InvalidPassword: return "Las contraseñas no coinciden"
        case .EmailTaken: return "Usuario ya existe."
        }
    }
}