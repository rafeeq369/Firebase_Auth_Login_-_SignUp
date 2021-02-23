//
//  SignUp_Controller.swift
//  FireBaseLogin
//
//  Created by intelmac on 22/02/21.
//

import UIKit
import FirebaseAuth
class FirebaseAuthManager: UIViewController {

    @IBOutlet weak var fbLoginBtn: UIButton!
    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var pswrdFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btns(btns: fbLoginBtn)
        
        self.fieldsRadius(field: emailFld)
        self.fieldsRadius(field: pswrdFld)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.title = ""
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func fieldsRadius(field: UITextField) {
        field.layer.cornerRadius = 25
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    @IBAction func createAcc(_ sender: Any) {
        didTapSignUpButton()
    }
    
    @objc func didTapSignUpButton() {
        let signUpManager = FirebaseAuthManager()
        if let email = emailFld.text, let password = pswrdFld.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.display(alertController: alertController)
            }
        }
    }
    
    func display(alertController: UIAlertController){
        self.present(alertController, animated: true, completion: nil)
    }
}
