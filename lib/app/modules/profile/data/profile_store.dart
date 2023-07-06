import 'package:dio/dio.dart';
import 'package:fin_infocom_project/app/models/profile_model.dart';
import 'package:fin_infocom_project/app/services/network_services.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  bool fetchingProfileData = false;

  @observable
  ProfileModel? profileData;

  @action
  Future<void> getProfileData() async {
    fetchingProfileData = true;
    Response response = await NetworkService.getProfileDetails();
    if (response.statusCode == 200) {
      profileData = ProfileModel.fromJson(response.data['results'][0]);
    }
    fetchingProfileData = false;
  }
}
