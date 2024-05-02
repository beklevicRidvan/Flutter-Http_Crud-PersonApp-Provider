import 'dart:math';

import 'package:flutter_realtime_database_http/model/person_model.dart';

class Constants{
  static PersonModel personModel = PersonModel(personName: "Static", personSurname: "Veri", personNumber: "05553332222");

 static dynamic generateRandomId() {
    // Rastgele ID oluşturma algoritmasını uygulayın
    // Bu örnekte, kısa bir rastgele dize kullanıyoruz, ancak gerçek bir UUID oluşturabilirsiniz.
    // Örneğin: https://pub.dev/packages/uuid
    return Random().nextInt(100000);
  }
}