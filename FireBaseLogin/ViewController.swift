//
//  ViewController.swift
//  FireBaseLogin
//
//  Created by intelmac on 22/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var one: UITextField!
    @IBOutlet weak var two: UITextField!
    @IBOutlet weak var three: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.field(fld: one)
        self.field(fld: two)
        self.field(fld: three)
        one.delegate = self
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        self.field(fld: one)
        self.field(fld: two)
        self.field(fld: three)

    }
    
    func field(fld: UITextField){
       // fld.textAlignment = .center
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: fld.frame.size.height - 10 , width: fld.frame.size.width, height: 1.5)
        bottomLine.backgroundColor = UIColor.systemGray2.cgColor
        fld.borderStyle = UITextField.BorderStyle.none
        fld.layer.addSublayer(bottomLine)
        
    
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == one {
            if one.text?.count == 4 {
                two.becomeFirstResponder()
            }
            
        }
        if textField == two {
            if two.text?.count == 4 {
                three.becomeFirstResponder()
            }
            
        }
        if textField == three {
            if three.text?.count == 4 {
                three.endEditing(true)
            }
            
        }
        
       // else if two.text?.count == 4 {
       //     three.becomeFirstResponder()
       // }
//        else if three.text?.count == 4 {
//
//        }
    }

}

