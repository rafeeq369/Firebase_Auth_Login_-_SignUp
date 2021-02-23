//
//  Login_Controller.swift
//  FireBaseLogin
//
//  Created by intelmac on 22/02/21.
//

import UIKit
import FirebaseAuth

class Login_Controller: UIViewController {

    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var fbLoginbtn: UIButton!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        btns(btns: logInBtn)
        btns(btns: fbLoginbtn)
        fieldsWithRadius(field: Email)
        fieldsWithRadius(field: Password)
        Password.textAlignment = .center
    }
    
    //MARK: - Navigation Bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.title = ""
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Firebase Log in coode Stared
   
    @IBAction func acc(_ sender: Any) {
        didTapLoginButton()
    }
    
    @objc func didTapLoginButton() {
        let loginManager = FirebaseAuthManager()
        guard let email = Email.text, let password = Password.text else { return }
        self.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                message = "User was sucessfully logged in."
                let vc = (self.storyboard?.instantiateViewController(withIdentifier: "Home_Controller"))! as! Home_Controller
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else {
                message = "There was an error."
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.display(alertController: alertController)
        }
    }
    
    func display(alertController: UIAlertController){
        self.present(alertController, animated: true, completion: nil)
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
    //Mark: - Firebase Log in coode Stared
    
}

extension UIViewController {
    func fieldsWithRadius(field: UITextField){
        field.layer.cornerRadius = 30
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.systemGray4.cgColor
    }
}

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
