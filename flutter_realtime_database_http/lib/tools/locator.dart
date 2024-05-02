import 'package:flutter_realtime_database_http/repository/database_repository.dart';
import 'package:flutter_realtime_database_http/service/real_time_rest_database/realtime_database.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

setupLocator(){
  locator.registerLazySingleton(() => DatabaseRepository());
  locator.registerLazySingleton(() => RealtimeDatabaseService());
}