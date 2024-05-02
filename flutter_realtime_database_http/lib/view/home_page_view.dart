import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/person_model.dart';
import '../view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text("a"),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  _buildBody() {
    return Consumer<HomePageViewModel>(
      builder: (context, value, child) {
        if (value.persons.isNotEmpty) {
          return ListView.builder(
            itemCount: value.persons.length,
            itemBuilder: (context, index) {

              return ChangeNotifierProvider.value(
                value: value.persons[index],
                child: _buildListItem(context, index),
              );


            },
          );
        } else {
          return const Center(
            child: Text(
              "VERİ YOK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }

  _buildListItem(BuildContext context, int index) {
    HomePageViewModel viewModel = Provider.of(context, listen: false);

    return Consumer<PersonModel>(
      builder: (context, person, child) {
        return Card(
          child: ListTile(
            title: Text("${person.personName} ${person.personSurname}"),
            subtitle: Text(person.personNumber.toString()),
            trailing: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () => viewModel.updateData(context, index),
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () => viewModel.deleteData(index),
                    icon: const Icon(Icons.clear))
              ],
            ),
          ),
        );
      },
    );



  }

  _buildFloatingActionButton(BuildContext context) {
    HomePageViewModel viewModel = Provider.of(context, listen: false);
    return FloatingActionButton(
      onPressed: () => viewModel.addData(context),
      shape: const CircleBorder(),
      backgroundColor: Colors.blue,
      child: const Icon(
        Icons.add,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
