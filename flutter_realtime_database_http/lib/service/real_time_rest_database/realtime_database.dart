import 'dart:convert';

import 'package:flutter_realtime_database_http/model/person_model.dart';
import 'package:flutter_realtime_database_http/service/database_base_service.dart';
import 'package:flutter_realtime_database_http/tools/constants.dart';
import 'package:http/http.dart' as http;

class RealtimeDatabaseService extends DatabaseBaseService {
  final API_URL =
      "https://firestore-uygulamalari-default-rtdb.europe-west1.firebasedatabase.app";
  @override
  Future addPerson(PersonModel personModel) async {
    var uri = Uri.parse("$API_URL/data/persons.json");
    var myKey = Constants.generateRandomId();

    String jsonBody = json.encode(
      personModel.toMap(key: myKey),
    );

    var response = await http.post(uri, body: jsonBody);

    Map<String,dynamic> map = json.decode(response.body);

    print(map["name"].toString());
    if (response.statusCode == 200) {
      // JSON yanıtını parse edin
      print(response.body.toString());
      return map["name"];

      print("VERİ EKLENDİ MK");
    } else {
      print("HATA VAR");
    }
  }

  @override
  Future<void> deletePerson(PersonModel personModel) async{
    var uri = Uri.parse("$API_URL/data/persons/${personModel.personId}.json");

     var element = await http.delete(uri);
     if (element.statusCode == 200){
       print("SİLME OK");
     }
     else{
       print("HATA VAR");
     }
  }

  @override
  Future getPersonData() async {

    var uri = Uri.parse("$API_URL/data/persons.json");
    var element = await http.get(uri);

    if (element.statusCode == 200) {

      final jsonModel = jsonDecode(element.body);





        List<PersonModel> persons = [];
      jsonModel.forEach((key,value){
        persons.add(PersonModel.fromMap(map: value,personKey: key));
      });
        return persons;

    } else {
      print("HATA OLUŞTU");
    }


  }



 static Stream<List<PersonModel>> getStreamData() async* {
    var uri = Uri.parse("https://firestore-uygulamalari-default-rtdb.europe-west1.firebasedatabase.app/data/persons.json");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonModel = jsonDecode(response.body);
      List<PersonModel> persons = [];
      jsonModel.forEach((key, value) {
        persons.add(PersonModel.fromMap(map: value, personKey: key));
      });
      yield persons; // Veriyi akışa döndür
    } else {
      print("HATA OLUŞTU");
    }
  }


  @override
  Future<void> updatePerson(String newPersonName, String newPersonSurname,
      String newPersonNumber, PersonModel personModel)async {
    var uri = Uri.parse("$API_URL/data/persons/${personModel.personId}.json");
    var element = await http.put(uri,body: jsonEncode(personModel.toUpdatedMap(newPersonName: newPersonName, newPersonSurname: newPersonSurname, newPersonNumber: newPersonNumber)));
    if(element.statusCode == 200){
      print("UPDATE OK ");
    }
    else{
      print("HATA VAR");
    }

  }
}
