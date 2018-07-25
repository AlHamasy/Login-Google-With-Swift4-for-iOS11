//
//  ViewController.swift
//  LoginGoogle
//
//  Created by asad on 24/07/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var labelUserEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if signIn == nil {
            labelUserEmail.text = "Silahkan Sign In"
        }
        
        labelUserEmail.text = user.profile.email
    }
    @IBAction func logOut(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signOut()
        labelUserEmail.text = "Sudah Log Out"
    }
    
}
