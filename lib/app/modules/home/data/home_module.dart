import 'package:fin_infocom_project/app/modules/dog_image/data/dog_image_store.dart';
import 'package:fin_infocom_project/app/modules/home/data/home_store.dart';
import 'package:fin_infocom_project/app/modules/home/ui/home_screen.dart';
import 'package:fin_infocom_project/app/modules/profile/data/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeStore()),
        Bind((i) => DogImageStore()),
        Bind((i) => ProfileStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const HomeScreen()),
      ];
}
