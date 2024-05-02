# Flutter-Http_Crud-PersonApp-Provider


Bu proje, Flutter kullanılarak geliştirilmiş bir kişi uygulamasıdır. Uygulama, Get_it, Provider ve MVVM(Model-View-ViewModel) mimarisi kullanılarak tasarlanmıştır.

## Açıklama

Bu kişi uygulaması, HTTP paketinin CRUD (Create, Read, Update, Delete) işlemlerini gerçekleştirmek için kullanılır. Firebase Realtime Database üzerinde barındırılan REST API adresine istekler gönderilir ve kişi verileri bu API üzerinde yönetilir.

## Kullanılan Teknolojiler

- **Flutter**: UI (User Interface) tasarımı ve iş mantığının geliştirilmesi için kullanılan çerçeve.
- **Get_it**: Bağımlılık enjeksiyonu için kullanılır. Bağımlılıkların tek bir yerden yönetilmesini sağlar.
- **Provider**: Durum yönetimi için kullanılır. Uygulama durumunun merkezi bir yerde yönetilmesini sağlar.
- **MVVM (Model-View-ViewModel)**: Uygulamanın mimarisi olarak kullanılır. Veri, arayüz ve iş mantığı ayrı katmanlarda organize edilir.

## Nasıl Kullanılır

1. Uygulama başlatıldığında, kişi listesi görüntülenir.
2. Kişi listesindeki herhangi bir kişiye tıklanarak, kişi bilgileri düzenlenebilir veya silinebilir.
3. Yeni bir kişi eklemek için, ekranın sağ alt köşesinde bulunan artı (+) simgesine tıklanabilir.

## Kurulum

Projenin yerel olarak çalıştırılması için:

1. Proje dosyalarını bilgisayarınıza indirin veya kopyalayın.
2. Flutter SDK'yı yükleyin ve Flutter projesini başlatın.
3. Projeyi bir IDE (Integrated Development Environment) ile açın ve terminalde `flutter pub get` komutunu çalıştırın.
4. Uygulamayı emülatörde veya gerçek cihazda çalıştırın. 
