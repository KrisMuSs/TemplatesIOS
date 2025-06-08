//
//  CircleButtonAnimation.swift
//  Crypto
//
//  Created by Артем Мерзликин on 08.06.2025.
//

import SwiftUI

// Назначение компонента - Анимированный круг

/* Этот компонент создает анимированную круговую обводку, которая:
 
 Появляется из центра (с масштаба 0)

 Одновременно увеличивается и исчезает */
struct CircleButtonAnimation: View {
    
   // animate - флаг, управляющий анимацией (true = запустить анимацию)
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
        //  Этот модификатор применяется к фигуре Circle() для того, чтобы задать обводку (контур) круга, а не заливать его цветом
            .stroke(lineWidth: 5.0)        // Обводка толщиной 5pt
            .scale(animate ? 1.0 : 0.0)    // Масштабирование: 0 → 100%
            .opacity(animate ? 0.0 : 1.0)  // Прозрачность: 100% → 0%
        // Мы используем эту строку, чтобы анимировать только в одном напровлении
        // Механизм анимации
        /*
         Анимация активируется только при animate == true
         Длительность: 1 секунда
         */
            .animation(animate ? Animation.easeInOut(duration: 1.0) : .none)
            .onAppear{
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimation(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}
