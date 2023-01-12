//
//  SingleCharKeyButton.swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

struct KeyboardKey: View {
  let char: String
  var secondaryChar: String = ""
  
  var alignment: Alignment = .center
  var secondaryCharAligment: Alignment = .center
  
  var buttonWidth: CGFloat = 80
  
  private var isSmallText: Bool {
    return getKeyCharFontSize(for: char) == 13
  }
  
  func getKeyCharFontSize(for char: String) -> CGFloat {
    if char.count == 1 {
      return 22
    }
    
    if secondaryChar.starts(with: "icon-") {
      return 13
    }
    
    return 16
  }
  
  func isItOnTheEdge(aligment: Alignment) -> Bool {
    return aligment == .bottomLeading || aligment == .bottomTrailing || aligment == .topLeading || aligment == .topTrailing
  }
  
  var body: some View {
    Button {
      print("You pressed at: \(char.uppercased()) key")
    } label: {
      VStack {
          Spacer()
        
        if !secondaryChar.isEmpty {
          HStack {
            if (secondaryChar.starts(with: "icon-")) {
              Image(systemName: String(secondaryChar.split(separator: "-")[1]))
                .font(.system(size: 16))
            } else {
              Text(secondaryChar)
                .font(.system(size: 16, weight: .regular))
                .padding(.top, 4)
            }
            
          }
          .padding(
            .horizontal,
            isItOnTheEdge(aligment: secondaryCharAligment) ? 12 : 0
          )
          .padding(.bottom, 1)
          .frame(width: buttonWidth, alignment: secondaryCharAligment)
        }
        
        if !secondaryChar.isEmpty {
          Spacer()
          Spacer()
        }
        
        if secondaryChar.starts(with: "icon-") {
          Spacer()
        }
        
        HStack {
          if char.starts(with: "icon-") {
            Image(systemName: String(char.split(separator: "-")[1]))
              .font(.system(size: 16))
          } else {
            Text(char)
              .font(
                .system(
                  size: getKeyCharFontSize(for: char)
                )
              )
          }
          
        }
        .frame(
          width: buttonWidth - 24,
          alignment: alignment
        )
       
        if alignment == .center {
          Spacer()
        }
      }
      .padding(.horizontal, 12)
      .padding(.vertical, 12)
      .frame(width: buttonWidth, height: 80)
      
    }
    .buttonStyle(.plain)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          Color.black.opacity(0.3),
          lineWidth: 1
        )
      
    )
    .background(
      RadialGradient(
        colors: [
          Color(hex: "#333438")!,
          Color(hex: "#1B1D21")!
        ],
        center: .center,
        startRadius: buttonWidth * 2 + 30,
        endRadius: 1)
    )
    .cornerRadius(8)
    .shadow(color: .black, radius: 2, x: 0, y: 1)
    
    
  }
}

struct SingleCharKeyButton_Previews: PreviewProvider {
  static var previews: some View {
    KeyboardKey(char: "1", secondaryChar: "!", alignment: .center, secondaryCharAligment: .center)
      .frame(width: 200, height: 200)
  }
}

