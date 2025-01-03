

import Foundation


// Класс для хранения и предоставления данных о waifu
class WaifuDataServices {
    
    // Доступно глобально без необходимости создавать экземпляр класса
    static let waifu: [Waifu] = [
        Waifu(name: "Эмилия", imageName: "emilia"),
        Waifu(name: "Рэм", imageName: "rem"),
        Waifu(name: "Рам", imageName: "ram"),
        Waifu(name: "Ехидна", imageName: "ehidna"),
        Waifu(name: "Беатрис", imageName: "beatris")
    ]
    
}
