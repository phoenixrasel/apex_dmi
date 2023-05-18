import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'componen/home_componet.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  late HomeComponent component;
  @override
  Widget build(BuildContext context) {
    component = HomeComponent(controller: controller);
    return Scaffold(
      appBar: AppBar(
        title: Text('Company List', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: component.floatingBtn(),
      body: Obx(() => controller.requesting.value == ApiCallStatus.FETCHING
          ? Center(
              child: Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            )
          : component.dataWidget()),
    );
  }
}
