//
//  User.swift
//  Proximity
//
//  Created by Kunal Shah on 2/28/18.
//  Copyright © 2018 Proximity. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class User: NSObject {
  
  // MARK: Attributes of each User Object
  
  let username: String
  let id: String
  
  // MARK: Methods
  
  
  
  
  // MARK: Initializers
  
  init(username: String, id: String) {
    self.username = username
    self.id = id
  }
  
}
