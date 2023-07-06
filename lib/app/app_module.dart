import 'package:fin_infocom_project/app/modules/home/data/home_module.dart';
import 'package:fin_infocom_project/app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Routes.home, module: HomeModule()),
      ];
}
