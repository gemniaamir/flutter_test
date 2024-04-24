import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:proctor/service/app_service.dart';

final locator = GetIt.instance;

void setup() {
  debugPrint('Setup is called');
  // locator.registerSingleton<AppService>(AppService());
  // locator.registerFactory<AppService>(() => AppService());
  locator.registerLazySingleton<AppService>(() => AppService());
}
