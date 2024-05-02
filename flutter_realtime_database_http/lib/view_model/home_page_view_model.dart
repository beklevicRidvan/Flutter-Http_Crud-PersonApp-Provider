import 'package:flutter/material.dart';
import 'package:flutter_realtime_database_http/service/real_time_rest_database/realtime_database.dart';

import '../model/person_model.dart';
import '../repository/database_repository.dart';
import '../tools/locator.dart';

class HomePageViewModel with ChangeNotifier {
  List<PersonModel> _persons = [];

  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _numberController;

  late TextEditingController _updatedNameController;
  late TextEditingController _updatedSurnameController;
  late TextEditingController _updatedNumberController;

 late Stream<List<PersonModel>> _stream;

  final _repository = locator<DatabaseRepository>();

  HomePageViewModel() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _numberController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  List<PersonModel> get persons => _persons;

  void getData() async {

    _persons = await _repository.getPersonData();
    notifyListeners();




  }

  void addData(BuildContext context) async {
    List<String>? result = await showAddDataDialog(context);
    if (result != null) {
      String personName = result[0];
      String personSurname = result[1];
      String personNumber = result[2];
      PersonModel personModel = PersonModel(
          personName: personName,
          personSurname: personSurname,
          personNumber: personNumber);
      dynamic personId = await _repository.addPerson(personModel);
      personModel.personId = personId;
      _persons.add(personModel);
      notifyListeners();
    }
  }

  void updateData(BuildContext context, int index) async {
    PersonModel personModel = _persons[index];
    List<String>? result = await showAddDataDialog(context,
        currentName: personModel.personName,
        currentSurname: personModel.personSurname,
        currentNumber: personModel.personNumber);
    if (result != null) {
      String newPersonName = result[0];
      String newPersonSurname = result[1];
      String newPersonNumber = result[2];
      personModel.updateData(newPersonName, newPersonSurname, newPersonNumber);
      await _repository.updatePerson(
          newPersonName, newPersonSurname, newPersonNumber, personModel);
    }
  }

  void deleteData(int index) async {
    var personModel = _persons[index];
    _persons.removeAt(index);
    await _repository.deletePerson(personModel);
    notifyListeners();
  }

  Future<List<String>?> showAddDataDialog(BuildContext context,
      {dynamic currentName,
      dynamic currentSurname,
      dynamic currentNumber}) async {
    _updatedNameController = TextEditingController(text: currentName ?? "");
    _updatedSurnameController =
        TextEditingController(text: currentSurname ?? "");
    _updatedNumberController = TextEditingController(text: currentNumber ?? "");

    return showDialog<List<String>?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("EDİT DATA"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: currentName != null
                      ? _updatedNameController
                      : _nameController,
                  decoration: const InputDecoration(hintText: "NAME"),
                ),
                TextField(
                  controller: currentSurname != null
                      ? _updatedSurnameController
                      : _surnameController,
                  decoration: const InputDecoration(hintText: "SURNAME"),
                ),
                TextField(
                  controller: currentNumber != null
                      ? _updatedNumberController
                      : _numberController,
                  decoration: const InputDecoration(hintText: "NUMBER"),
                ),
              ],
            ),
          ),
          actions: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      "IPTAL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
                ElevatedButton(
                    onPressed: () {
                        if(currentName != null && currentSurname != null && currentNumber != null){
                          if(_updatedNameController.text.isNotEmpty && _updatedNumberController.text.isNotEmpty && _updatedSurnameController.text.isNotEmpty ){
                            Navigator.pop(context,[_updatedNameController.text,_updatedSurnameController.text,_updatedNumberController.text]);
                          }
                        }
                      else{
                          if (_nameController.text.isNotEmpty &&
                              _surnameController.text.isNotEmpty &&
                              _numberController.text.isNotEmpty) {
                            Navigator.pop(context, [
                              _nameController.text,
                              _surnameController.text,
                              _numberController.text
                            ]);
                          }
                        }
                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      "TAMAM",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ))
              ],
            ),
          ],
        );
      },
    );
  }
}
