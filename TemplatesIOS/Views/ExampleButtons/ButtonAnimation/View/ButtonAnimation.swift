//
//  HomeView.swift
//  Crypto
//
//  Created by Артем Мерзликин on 08.06.2025.
//

import SwiftUI

struct ButtonAnimation: View {
    
    // Переменная для реакции на нажатие кнопки со стрелкой.
    // - Поворачивает стрелку на 180 градусов
    // - Изменяет надписи
    @State private var showPortfolio = false
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    ButtonAnimation()
}

extension ButtonAnimation {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "info" : "plus")
            // Убераем странную анимацию при изменении кнопки
                .animation(.none)
                .background(
                    CircleButtonAnimation(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            // Убераем странную анимацию при изменении кнопки
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    // В SwiftUI withAnimation — это функция, которая позволяет анимировать изменения состояния с заданными параметрами анимации. Если добавить withAnimation(.spring()) в код, то анимация круга станет с пружинным эффектом.
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                        
                    }
                }
            
        }
        .padding(.horizontal)
    }
}
