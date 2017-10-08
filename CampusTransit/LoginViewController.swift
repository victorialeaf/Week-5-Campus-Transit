//
//  LoginViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 10/7/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var container: UIView!
    
    @IBAction func btnLogin_TouchUpInside(_sender: Any){
        
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Login Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in
                        print("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
