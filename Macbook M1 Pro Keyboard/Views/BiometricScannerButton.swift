//
//  BiometricScannerButton.swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

struct BiometricScannerButton: View {
  var body: some View {
    Button {
      print("pressed finger print scanner button")
    } label: {
      Circle()
        .stroke(.black.opacity(0.2), lineWidth: 3)
        .padding(.all, 16)
    }
    .buttonStyle(.plain)
    .frame(width: 80, height: 80)
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
        startRadius: 80 * 2 + 30,
        endRadius: 1)
    )
    .cornerRadius(8)
    .shadow(color: .black, radius: 2, x: 0, y: 1)

  }
}

struct BiometricScannerButton_Previews: PreviewProvider {
  static var previews: some View {
    BiometricScannerButton()
      .frame(width: 200, height: 200)
  }
}

