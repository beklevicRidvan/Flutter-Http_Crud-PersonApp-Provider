import 'package:flutter_realtime_database_http/base/database_base.dart';
import 'package:flutter_realtime_database_http/model/person_model.dart';
import 'package:flutter_realtime_database_http/service/real_time_rest_database/realtime_database.dart';
import 'package:flutter_realtime_database_http/tools/locator.dart';

class DatabaseRepository extends DatabaseBase{
  final _service = locator<RealtimeDatabaseService>();
  @override
  Future addPerson(PersonModel personModel) async{
    return await _service.addPerson(personModel);
  }

  @override
  Future<void> deletePerson(PersonModel personModel) async{
   await _service.deletePerson(personModel);
  }

  @override
  Future getPersonData()async {
   return await _service.getPersonData();
  }

  @override
  Future<void> updatePerson(String newPersonName, String newPersonSurname, String newPersonNumber, PersonModel personModel)async {
    await _service.updatePerson(newPersonName, newPersonSurname, newPersonNumber, personModel);
  }
  
}