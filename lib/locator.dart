import 'package:get_it/get_it.dart';
import 'package:dialog_manager/services/dialog_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
}
