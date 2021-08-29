//
//  ViewController.swift
//  KeyboardLayoutGuide
//
//  Created by Demjen Daniel on 2021. 08. 26..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomConstraint.isActive = false
        bottomConstraint = nil
        
        bottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor,
                                                              constant: 0)
        bottomConstraint.isActive = true
        
        stackView.subviews.forEach { ($0 as? UITextField)?.delegate = self }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
