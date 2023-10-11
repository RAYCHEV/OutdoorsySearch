//
//  CustomTextFieldStyle.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//

import SwiftUI

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            .padding()
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldStyle())
    }
}
