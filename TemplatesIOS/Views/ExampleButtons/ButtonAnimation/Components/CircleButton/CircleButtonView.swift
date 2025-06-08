//
//  CircleButtonView.swift
//  Crypto
//
//  Created by Артем Мерзликин on 08.06.2025.
//

import SwiftUI

/*
 Имеет стильное оформление с тенью
 Поддерживает светлую и тёмную тему
 Принимает любую SF Symbol через параметр iconName
 */
struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Text(Image(systemName: iconName))
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                // Создает круглый фон с цветом из темы
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
        // Тень цвета .accent с прозрачностью 30%
        // Размытие 10 точек, смещение по Y на 5 точек (эффект "парения")
            .shadow(
                color: Color.theme.accent.opacity(0.3),
                radius: 10, x: 0, y: 5
            )
            .padding()

    }
}

// Обрезать превью для компонентов
#Preview( traits: .sizeThatFitsLayout,
         body: {
    // Демонстрация иконки в светлой теме
    CircleButtonView(iconName: "info")
    // Демонстрация иконки в темной теме
    CircleButtonView(iconName: "plus")
        .colorScheme(.dark)
    
})
