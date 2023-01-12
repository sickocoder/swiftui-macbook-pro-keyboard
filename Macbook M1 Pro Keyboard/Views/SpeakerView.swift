//
//  SpeakerView.swift
//  Macbook M1 Pro Keyboard
//
//  Created by José Tony on 12/01/23.
//

import SwiftUI

struct SpeakerView: View {
  var dotsPerLine: Int = 5
  
  var body: some View {
    VStack {
      Spacer()
      ForEach(0..<60) { row in
        HStack {
          ForEach(0..<dotsPerLine) { index in
            Circle()
              .stroke(.black.opacity(0.3), lineWidth: 1.5)
              .frame(width: 1, height: 1)
              .background(.black.opacity(0.3))
          }
        }
      }
      Spacer()
      Spacer()
      Spacer()
      Spacer()
    }
  }
}

struct SpeakerView_Previews: PreviewProvider {
  static var previews: some View {
    SpeakerView()
  }
}

