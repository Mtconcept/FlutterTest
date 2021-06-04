import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_request_test/controller/sub_Notifier.dart';

class SubsctiptionVieew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<SubNotifier>(
        init: SubNotifier(),
        builder: (model) => Column(
          children: [
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  subDesigns(SubData(0, model.groupValue, "N3000", "N5000", () {
                    model.updateGroupValue(0);
                  })),
                  SizedBox(
                    width: 16,
                  ),
                  subDesigns(SubData(1, model.groupValue, "N3000", "N5000", () {
                    model.updateGroupValue(1);
                  })),
                  SizedBox(
                    width: 16,
                  ),
                  subDesigns(SubData(2, model.groupValue, "N3000", "N5000", () {
                    model.updateGroupValue(2);
                  })),
                ],
              ),
            ),
            SizedBox(height: 60),
            model.groupValue == 0
                ? ListTile(
                    leading: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.red,
                    ),
                    title: Text("Some Data here"),
                  )
                : model.groupValue == 1
                    ? Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.green),
                      )
                    : Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.purple),
                      ),
            Spacer(),
            RaisedButton(
              onPressed: () {},
              child: Text("Choose Premium"),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

subDesigns(SubData data) {
  return InkWell(
    onTap: data.onTap,
    child: Container(
      height: data.index == data.groupValue ? 150 : 100,
      width: 100,
      color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: [
          data.index == data.groupValue
              ? Container(height: 50, color: Colors.red)
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          Text(data.amount)
        ],
      ),
    ),
  );
}

class SubData {
  final int index;
  final int groupValue;
  final String price;
  final String amount;
  final Function onTap;

  SubData(this.index, this.groupValue, this.price, this.amount, this.onTap);
}
