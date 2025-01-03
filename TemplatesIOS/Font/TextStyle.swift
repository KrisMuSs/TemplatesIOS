//
//  TextStyle.swift
//  TemplatesIOS
//
//  Created by Артем Мерзликин on 03.01.2025.
//

import SwiftUI

struct TextStyle: View {
    var body: some View {
        VStack(spacing: 15){
            Text("Italicized Text")
                .italic()
            Text("Underlined Text")
                .underline()
            Text("Strikethrough Text")
                .strikethrough()
            Text("pattern       dot")
                .strikethrough(pattern: .dot)
            Text("color pink")
                .strikethrough(pattern: .dash, color: .pink)
            Text("pattern dot")
                .underline(pattern: .dot, color: .accentColor)
            Text("expanded")
                .fontWidth(.expanded)
            Text("standard")
                .fontWidth(.standard)
            Text("condensed")
                .fontWidth(.condensed)
            Text("compressed")
                .fontWidth(.compressed)
        }
        
     
    }
}

#Preview {
    TextStyle()
}
