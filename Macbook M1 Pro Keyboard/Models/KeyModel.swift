//
//  KeyModel.swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

enum KeyModelType {
  case normal
  case arrow
  case fingerPrintScanner
}

struct KeyModel: Identifiable {
  let id = UUID()
  let mainChar: String
  var secondaryChar: String = ""
  var mainCharAligment: Alignment = .center
  var secondaryCharAligment: Alignment = .center
  var type: KeyModelType = .normal
  
  var buttonWidth: CGFloat = 80
}
