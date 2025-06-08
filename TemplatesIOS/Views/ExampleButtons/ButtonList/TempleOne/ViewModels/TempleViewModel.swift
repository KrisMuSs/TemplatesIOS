

import SwiftUI

class TempleViewModel: ObservableObject{
    
    //Переменная со всеми данными
    @Published var waifu: [Waifu]
    
    init() {
        // Получение массива данных waifu из WaifuDataServices
        let waifu = WaifuDataServices.waifu
        
        // Присваивание полученных данных локальной переменной класса
        self.waifu = waifu
    }
    
}

