//
//  ExampleColorFeature.swift
//  TemplatesIOS
//
//  Created by Артем Мерзликин on 08.06.2025.
//

import SwiftUI

struct ExampleColorFeature: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
           
            VStack(spacing: 40){
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Seccondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
                
            }
        }
    }
}

#Preview {
    ExampleColorFeature()
}
