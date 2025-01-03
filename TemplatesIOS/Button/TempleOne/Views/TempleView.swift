
import SwiftUI

struct TempleView: View {
    
    // Свойство, которое отслеживает состояние переключателя кнопки
    @State var toggleButton:Bool = false
    
    // Свойство для доступа к объекту модели представления (ViewModel)
    @EnvironmentObject private var vm: TempleViewModel
    
    var body: some View {
        ZStack{
            Color.mint
    // Обязательно, чтобы кнопка не уехала не применяем это свойство к ней
                .ignoresSafeArea()

            VStack{
                header
                    .padding()
                Spacer()
            }
            
           
        }
    }
}


extension TempleView {
    
    private var header: some View{
        VStack{
            
            Button(action: {
                // Анимация при переключении состояния кнопки
                withAnimation(.easeInOut) {
                    // Переключаем состояние toggleButton
                    toggleButton.toggle()
                }
            }) {
                // Текст кнопки
                Text("Waifu from ReZero")
                    .font(.title2) // Устанавливаем стиль шрифта
                    .fontWeight(.black) // Толщина текста
                    .foregroundColor(.primary) // Цвет текста (зависит от темы)
                    .frame(height: 50) // Устанавливаем высоту кнопки
                    .frame(maxWidth: .infinity) // Задаём максимальную ширину
                    .overlay(alignment: .leading) { // Добавляем изображение слева
                Image(systemName: "arrow.down") // Системное изображение стрелки вниз
                    .font(.headline) // Размер шрифта стрелки
                    .foregroundColor(.primary) // Цвет стрелки
                    .padding() // Отступы для изображения
                    .rotationEffect(Angle(degrees: toggleButton ? 180 : 0)) // Анимация поворота стрелки
                                   }
                           }
            // Если toggleButton == true, показываем список
                if toggleButton{
                    List{
                        ForEach(vm.waifu) { row in
                            ListRowView(row: row)
                                .listRowBackground(Color.clear)
                                .padding(.vertical, 2)
                        }
                    }
                    .listStyle(PlainListStyle())
            }
            
        }
        .background(.thickMaterial) // Фон с эффектом размытия
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3),radius: 20, x: 0, y: 15)
    }

}


extension TempleView {
    
    // Раздел для создания отдельной строки списка
    private func ListRowView(row: Waifu) -> some View{
        HStack{
            Image(row.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            
            Text("\(row.name)")
                    .font(.headline)
                    .foregroundColor(.black)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        

    }
}



#Preview {
    TempleView()
        .environmentObject(TempleViewModel()) // Передача экземпляра TempleViewModel

}
