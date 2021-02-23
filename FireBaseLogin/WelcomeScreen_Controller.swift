//
//  WelcomeScreen_Controller.swift
//  FireBaseLogin
//
//  Created by intelmac on 22/02/21.
//

import UIKit

class WelcomeScreen_Controller: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btns(btns: loginBtn)
        btns(btns: SignUpBtn)
        SignUpBtn.layer.borderWidth = 2
        SignUpBtn.layer.borderColor = UIColor.systemGray3.cgColor
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
}

extension UIViewController {
    func btns(btns: UIButton){
        btns.layer.cornerRadius = 25
      
    }
}
