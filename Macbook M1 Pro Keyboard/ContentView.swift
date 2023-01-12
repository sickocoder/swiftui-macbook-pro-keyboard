//
//  ContentView.swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    VStack {
      ZStack {
        Color(hex: "#B1B2B6")
        
        HStack(alignment: .center) {
          SpeakerView(dotsPerLine: 7)
            .padding(.trailing, 3)
          
          VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
              ForEach(0..<6) { index in
                HStack(spacing: 12) {
                  ForEach(keyboardData[index]) { keyData in
                    switch keyData.type {
                    case .normal:
                      KeyboardKey(
                        char: keyData.mainChar,
                        secondaryChar: keyData.secondaryChar,
                        alignment: keyData.mainCharAligment, secondaryCharAligment: keyData.secondaryCharAligment,
                        buttonWidth: keyData.buttonWidth
                      )
                    
                    case .arrow:
                      ArrowKeyboardKey(
                        icon: keyData.mainChar,
                        topIcon: keyData.secondaryChar
                      )
                    case .fingerPrintScanner:
                      BiometricScannerButton()
                    }
                    
                    
                  }
                }
              }
            }
            .padding(12)
            .background(Color(hex: "#202226"))
            .cornerRadius(16)
            .shadow(color: .black, radius: 1, x: 0, y: -2)
            
            HStack {
              HStack {}
                .frame(width: 580, height: 320)
                .overlay(
                  RoundedRectangle(cornerRadius: 16)
                    .stroke(
                      Color.black.opacity(0.1),
                      lineWidth: 2
                    )
                )
                .padding(.top, 8)
            }
            .padding(.bottom, 8)
          }
          
          SpeakerView(dotsPerLine: 7)
            .padding(.leading, 3)
        }
      }
      .frame(width: 1495, height: 980)
      .cornerRadius(16)
      .scaleEffect(0.98)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .frame(width: 2000, height: 1020)
  }
}



