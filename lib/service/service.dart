import 'package:get/get.dart';
import 'package:network_request_test/models/random_user_model.dart';

class Service extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://randomuser.me/';
    httpClient.defaultContentType = "json";
    httpClient.timeout = Duration(seconds: 8);
    httpClient.addResponseModifier((request, response) async {
      print(request.url);
      print(request.method);
      print(response.body);
      print(response.status.code);
    });
    httpClient.addRequestModifier((request) async {
      print(request.url);
      print(request.method);
      print(request.decoder);
      print(request.headers);
      return request;
    });
    super.onInit();
  }

  Future<RandomUserModel> getUser() async {
    var res = await get("api/");
    if (res.statusCode < 205) {
      return RandomUserModel.fromJson(res.body);
    } else {
      throw "Error Occurred";
    }
  }
}
