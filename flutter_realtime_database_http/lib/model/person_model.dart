import 'package:flutter/material.dart';

class PersonModel with ChangeNotifier{
  dynamic personId;
  String personName;
  String personSurname;
  String personNumber;


  PersonModel({this.personId,required this.personName,required this.personSurname,required this.personNumber});

  factory PersonModel.fromMap({required Map<String,dynamic>map,dynamic personKey}){
    return PersonModel(personId: personKey ?? map["personId"],personName: map["personName"], personSurname: map["personSurname"], personNumber: map["personNumber"]);
  }

  Map<String,dynamic> toMap({dynamic key}){
    return {
      "personId":key ?? personId,
      "personName":personName,
      "personSurname":personSurname,
      "personNumber":personNumber
    };
  }


  Map<String,dynamic> toUpdatedMap({required String newPersonName,required String newPersonSurname,required String newPersonNumber}){
    return {
      "personId":personId,
      "personName":newPersonName,
      "personSurname":newPersonSurname,
      "personNumber":newPersonNumber

    };
  }

  void updateData(String newPersonName,String newPersonSurname,String newPersonNumber){
    personName = newPersonName;
    personSurname = newPersonSurname;
    personNumber = newPersonNumber;
    notifyListeners();
  }
}