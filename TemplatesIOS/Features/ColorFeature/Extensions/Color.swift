

import Foundation
import SwiftUI

// Благодаря этому участку коду мы сможем добраться до ColorTheme через статик в Color
// Поддержка Темной темы. Для настройки цветовой схемы
extension Color {
    
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    // Можем дакинуть больше цветов
    // ...

}

// Можем для тестирования добавить вторую тему
//struct ColorTheme2 {
//    let accent = Color("AccentColor")
//    let background = Color("BackgroundColor")
//    let green = Color("GreenColor")
//    let red = Color("RedColor")
//    let secondaryText = Color("SecondaryTextColor")
//
//
//}
