import 'package:flutter_realtime_database_http/model/person_model.dart';

abstract class DatabaseBase{
  Future<dynamic> getPersonData();
  Future<dynamic> addPerson(PersonModel personModel);
  Future<void> deletePerson(PersonModel personModel);
  Future<void> updatePerson(String newPersonName,String newPersonSurname,String newPersonNumber,PersonModel personModel);
}