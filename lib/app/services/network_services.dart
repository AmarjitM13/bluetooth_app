import 'package:dio/dio.dart';

class NetworkService {
  static Future<String?> getDogImage() async {
    try {
      Response response =
          await Dio().get('https://dog.ceo/api/breeds/image/random');
      if (response.statusCode == 200) {
        return response.data['message'].toString();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<Response> getProfileDetails() async {
    Response response = await Dio().get('https://randomuser.me/api/');
    return response;
  }
}
