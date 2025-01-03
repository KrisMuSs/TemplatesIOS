
import SwiftUI

// Структура Waifu, которая представляет данные об одной waifu
// Реализует протокол Identifiable, чтобы легко использовать в SwiftUI списках
struct Waifu: Identifiable{
    
    // Уникальный идентификатор для каждого объекта Waifu
    // Генерируется автоматически с помощью UUID
    let id = UUID().uuidString
    
       // Имя waifu, которое будет отображаться
       let name: String
       
       // Имя изображения waifu, соответствующее имени файла в проекте
       let imageName: String
}
