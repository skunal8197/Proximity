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
  @IBOutlet weak var signUpPasswordField: UITextField!
  
  @IBOutlet var loginView: UIView!
  @IBOutlet weak var loginUsernameField: UITextField!
  @IBOutlet weak var loginPasswordField: UITextField!
  
  @IBOutlet var warningLabels: [UILabel]!
  @IBOutlet var inputFields: [UITextField]!
  
  var loginViewTopConstraint: NSLayoutConstraint!
  var registerTopConstraint: NSLayoutConstraint!
  
  var isLoginViewVisible = true
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    get {return UIInterfaceOrientationMask.portrait}
  }
  
  // MARK: Methods
  
  func handleViewRendering() {
    self.darkView.alpha = 0
    
    //Login View customization
    self.loginView.translatesAutoresizingMaskIntoConstraints = false
    self.loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    self.loginViewTopConstraint = NSLayoutConstraint.init(item: self.loginView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60)
    self.loginViewTopConstraint.isActive = true
    self.loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45).isActive = true
    self.loginView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
    self.loginView.layer.cornerRadius = 8
    
    //Sign Up View Customization
    self.signUpView.translatesAutoresizingMaskIntoConstraints = false
    self.signUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    self.registerTopConstraint = NSLayoutConstraint.init(item: self.signUpView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 1000)
    self.registerTopConstraint.isActive = true
    self.signUpView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6).isActive = true
    self.signUpView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
    self.signUpView.layer.cornerRadius = 8
  }
  
  func showLoading(state: Bool)  {
    if state {
      self.darkView.isHidden = false
      self.spinner.startAnimating()
      UIView.animate(withDuration: 0.3, animations: {
        self.darkView.alpha = 0.5
      })
    } else {
      UIView.animate(withDuration: 0.3, animations: {
        self.darkView.alpha = 0
      }, completion: { _ in
        self.spinner.stopAnimating()
        self.darkView.isHidden = true
      })
    }
  }
  
  func pushToNavigationViewController() {
    let navigationViewController = self.storyboard?.instantiateViewController(withIdentifier: "Navigation") as! NavigationViewController
    self.show(navigationViewController, sender: nil)
  }
  
  // MARK: IBActions - Executed on specified button tap
  
  @IBAction func createNewAccountBtnTapped(_ sender: UIButton) {
    if self.isLoginViewVisible {
      self.isLoginViewVisible = false
      sender.setTitle("Login", for: .normal)
      self.loginViewTopConstraint.constant = 1000
      self.registerTopConstraint.constant = 60
    } else {
      self.isLoginViewVisible = true
      sender.setTitle("Create New Account", for: .normal)
      self.loginViewTopConstraint.constant = 60
      self.registerTopConstraint.constant = 1000
    }
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
      self.view.layoutIfNeeded()
    })
    for item in self.warningLabels {
      item.isHidden = true
    }
  }
  
  @IBAction func signUpBtnTapped(_ sender: Any) {
    print("hello world")
  }
  
  
  
  // MARK: View Controller Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
}
