import 'package:get/get.dart';
import 'package:network_request_test/models/random_user_model.dart';
import 'package:network_request_test/service/service.dart';

class RandomCtr extends GetxController {
  var service = Get.put(Service());

  var isLoading = false.obs;
  var isError = "".obs;
  var resultData = RandomUserModel().obs;

  getRandomUser() async {
    isLoading.value = true;
    try {
      var res = await service.getUser();
      resultData.value = res;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  @override
  void onInit() {
    getRandomUser();
    super.onInit();
  }
}
