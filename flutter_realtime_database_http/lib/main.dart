import 'package:flutter/material.dart';
import 'package:flutter_realtime_database_http/tools/locator.dart';
import 'package:flutter_realtime_database_http/view/home_page_view.dart';
import 'package:flutter_realtime_database_http/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

void main(){
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (context) => HomePageViewModel(),child: const HomePageView(),),
    );
  }
}
