//
//  SignInHandler.swift
//  AppleSignIn
//
//  Created by Rizwan Ahmed A on 06/08/19.
//  Copyright © 2019 Rizwan Ahmed A. All rights reserved.
//

import UIKit
import AuthenticationServices

typealias SignInSuccessBlock = ((_ success : ASAuthorizationAppleIDProvider.CredentialState)->())
typealias SignInFailureBlock = ((_ error : Error?)->())



@available(iOS 13.0, *)
class SignInHandler : NSObject{
    
    var window : UIWindow? = nil

    init(withWindow window : UIWindow) {
        super.init()
        self.window = window
    }
    
    func getAppleSigninButton() -> ASAuthorizationAppleIDButton{
        let signInButton = ASAuthorizationAppleIDButton()
        signInButton.addTarget(self, action: #selector(handleSigninAction), for: .touchUpInside)
        return signInButton
    }
    
    
    @objc func handleSigninAction() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}

@available(iOS 13.0, *)
extension SignInHandler : ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print(userIdentifier,fullName ?? "Not found",email ?? "Not found")
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            print(username,password)
   
        }
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //Handle erorr here.
        
        print(error)
    }
}

@available(iOS 13.0, *)
extension SignInHandler : ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window!
    }    
}
