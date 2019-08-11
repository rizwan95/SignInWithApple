//
//  ViewController.swift
//  AppleSignIn
//
//  Created by Rizwan Ahmed A on 06/08/19.
//  Copyright © 2019 Rizwan Ahmed A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var signInHandler : SignInHandler = {
        let handler =  SignInHandler(withWindow: self.view.window ?? UIWindow())
        return handler
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

    private func configureUI(){
        let signInButton = signInHandler.getAppleSigninButton()
        self.view.addSubview(signInButton)
        signInButton.center = view.center
    }

}

