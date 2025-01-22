import SwiftUI

struct DetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            // GeometryReader позволяет отслеживать геометрию представлений внутри него
            GeometryReader { reader in
                // Проверяем, есть ли URL изображения
                if let url = article.urlToImage, let imageURL = URL(string: url) {
                    // Асинхронная загрузка изображения
                    AsyncImage(url: imageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable() // Делаем изображение изменяемым по размеру
                                .aspectRatio(contentMode: .fill) // Устанавливаем заполнение контейнера
                                
        // Сдвигаем изображение по оси Y выше, за пределы экрана
        // Начало координаты с которой начинается изображение не (0,0), а (0,62). Мы сместили
        //координату (0,62) на координату (0,0)
                                // Это создает ощущение движения изображения относительно прокрутки
                                .offset(y: -reader.frame(in: .global).minY)
                                
                                // Устанавливаем высоту изображения, которая увеличивается при прокрутке вниз,
                                // чтобы растянуть его в соответствии с параллакс-эффектом
                            
                            /*
                            Изменение высоты происходит динамически. Мы от начало экрана в реальном времени
                            изменяем размер картинки. Он изменятся сохраняя пропорции. Изменение происходит относительно начало экрана. Соответственно если мы двигаем вверх он уменьшается, если вниз увеличивается. Получается изменяется ТОЛЬКО координата y, координата x остается без изменений.
                             */
                                .frame(
                                    width: SizeContains.sizeWidth,
                                    height: reader.frame(in: .global).minY + SizeContains.sizeHeight + 10
                                )
                        }
                    }
                }

            }
            // Высота области, в которой будет отображаться изображение
            .frame(height: SizeContains.sizeHeight)
        }
    }
}

#Preview {
    DetailView(
        article: Article(
            urlToImage: "https://cdn.punchng.com/wp-content/uploads/2020/04/09180349/tiktok.png"
        )
    )
}

struct SizeContains{
    static var sizeHeight: CGFloat{
        UIScreen.main.bounds.height / 2
    }
    
    static var sizeWidth: CGFloat{
        UIScreen.main.bounds.width
    }
}
