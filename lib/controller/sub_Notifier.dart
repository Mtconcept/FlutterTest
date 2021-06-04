import 'package:get/get.dart';

class SubNotifier extends GetxController {
  int groupValue = 0;

  updateGroupValue(int index) {
    groupValue = index;
    // use notify listener
    update();
  }
}
