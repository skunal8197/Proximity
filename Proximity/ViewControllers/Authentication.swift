//
//  Authentication.swift
//  Proximity
//
//  Created by Kunal Shah on 2/26/18.
//  Copyright © 2018 Proximity. All rights reserved.
//

import UIKit

class Authentication: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
  
  // MARK: Properties from Storyboard
  
  @IBOutlet weak var darkView: UIView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  @IBOutlet var signUpView: UIView!
  @IBOutlet weak var signUpUsernameField: UITextField!
  
  
  @IBOutlet var inputFields: [UITextField]!
  
  // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
}
