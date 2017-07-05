//
//  SecondViewController.swift
//  MapboxNavigation
//
//  Created by Emery Silberman on 7/4/17.
//  Copyright © 2017 Mapbox. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SecondViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var alert = UIAlertController(title: "Hey", message: "This is  one Alert", preferredStyle: UIAlertControllerStyle.alert)
    
    
    @IBAction func signIn(_ sender: Any) {
        
        if let username = usernameTextField.text, let pass = passwordTextField.text {
            Auth.auth().signIn(withEmail: username, password: pass, completion: { (user, error) in
                if let u = user {
                    self.performSegue(withIdentifier: "showMap", sender: self)
                    
                }
                else {
                    
                    self.present(self.alert, animated: true, completion: nil)
                }
            })
        }
        else{
            alert.addAction(UIAlertAction(title: "Working!!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        guard let text = usernameTextField.text, !text.isEmpty else {
            return
        }
      //  text.characters.count  //do something if it's not empty
        //self.performSegue(withIdentifier: "showmap", sender: self)
    }
            override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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



