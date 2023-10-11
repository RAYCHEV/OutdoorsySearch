//
//  RoundedImageStyle,swift.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//

import SwiftUI

struct SlightlyRoundedImageStyle: ViewModifier {
    var size: CGFloat
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.white, lineWidth: 2))
    }
}

extension Image {
    func slightlyRoundedImageStyle(size: CGFloat = 100, cornerRadius: CGFloat = 30) -> some View {
        self
            .resizable()
            .modifier(SlightlyRoundedImageStyle(size: size, cornerRadius: cornerRadius))
    }
}
