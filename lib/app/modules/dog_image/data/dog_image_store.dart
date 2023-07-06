import 'package:fin_infocom_project/app/services/network_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'dog_image_store.g.dart';

class DogImageStore = _DogImageStore with _$DogImageStore;

abstract class _DogImageStore with Store {
  @observable
  bool fetchingData = false;

  @observable
  String? dogImageUrl;

  @action
  Future<void> loadDogImage() async {
    fetchingData = true;
    dogImageUrl = await NetworkService.getDogImage();
    debugPrint(dogImageUrl);
    fetchingData = false;
  }
}
