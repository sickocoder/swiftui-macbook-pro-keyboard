//
//  ArrowKeyboardKey..swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

struct ArrowButton: View {
  var icon: String
  
  var body: some View {
    Button {
      print("pressed arrow key")
    } label: {
      Image(systemName: icon)
        .font(.system(size: 10))
        .tint(.white)
    }
    .buttonStyle(.plain)
    .frame(width: 80, height: 30)
    .background(
      RadialGradient(
        colors: [
          Color(hex: "#333438")!,
          Color(hex: "#1B1D21")!
        ],
        center: .center,
        startRadius: 80 * 2 + 30,
        endRadius: 1)
    )
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          Color.black.opacity(0.3),
          lineWidth: 1
        )
      
    )
    .cornerRadius(8)
    .shadow(color: .black, radius: 2, x: 0, y: 1)
  }
}

struct ArrowKeyboardKey: View {
  var icon: String
  var topIcon: String = ""
  
    var body: some View {
      VStack {
        Spacer()
        
        if !topIcon.isEmpty {
          ArrowButton(icon: topIcon)
        }
        ArrowButton(icon: icon)
      }
      .frame(width: 80, height: 80)
    }
}

struct ArrowKeyboardKey_Previews: PreviewProvider {
    static var previews: some View {
        ArrowKeyboardKey(icon: "arrowtriangle.down.fill", topIcon: "arrowtriangle.up.fill")
        .frame(width: 200, height: 200)
    }
}
