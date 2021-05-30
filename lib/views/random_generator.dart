import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_request_test/controller/random_user_controller.dart';

class RandomGenerator extends StatelessWidget {
  final data = Get.put(RandomCtr());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Obx(() {
            if (data.isLoading.value == true)
              return Center(child: CircularProgressIndicator.adaptive());
            else
              return data.resultData.value.results == null
                  ? Center(
                      child: TextButton(
                          onPressed: () {
                            data.getRandomUser();
                          },
                          child: Text("Get Random User")),
                    )
                  : Center(
                      child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            data.resultData.value.results[0].picture.medium),
                      ),
                      title: Text(data.resultData.value.results[0].name.first +
                          data.resultData.value.results[0].name.last),
                      subtitle:
                          Text(data.resultData.value.results[0].name.title),
                    ));
          }),
        ]));
  }
}
