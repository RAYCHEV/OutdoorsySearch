//
//  HorizontalRule.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//

import SwiftUI

struct HorizontalRule: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color.gray)
    }
}

struct HorizontalRule_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRule()
    }
}
