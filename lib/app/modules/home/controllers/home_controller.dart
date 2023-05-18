import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_apex_dmit_ltd/app/data/services/repository.dart';

enum ApiCallStatus { IDLE, FETCHING, DONE, ERROR }

class HomeController extends GetxController {
  var requesting = ApiCallStatus.IDLE.obs;
  var submitting = ApiCallStatus.IDLE.obs;

  Map<String, TextEditingController> inputs = {
    "company-name": TextEditingController(),
    "email": TextEditingController(),
    "password": TextEditingController(),
    "phone": TextEditingController(),
  };

  var data = <dynamic>[].obs;

  fetchAllData() async {
    requesting(ApiCallStatus.FETCHING);
    try {
      Repository().requestCompanyList().then((response) {
        data(response['company_list']['data']);
        requesting(ApiCallStatus.DONE);
      });
    } on Exception catch (e) {}
  }

  submitCompany() async {
    submitting(ApiCallStatus.FETCHING);
    try {
      Repository().submitCompanyList(body: {
        "company_name": inputs['company-name']!.text,
        "email": inputs['email']!.text,
        "password": inputs['password']!.text,
        "phone": inputs['phone']!.text
      }).then((response) {
        if (response['status_code'] == 0) {
          submitting(ApiCallStatus.DONE);
          showError("Company addation failed");
        } else {
          Get.back();
          fetchAllData();
          submitting(ApiCallStatus.DONE);
          showSuccess("Company added");
        }
      });
    } on Exception catch (e) {}
  }

  showError(msg) => Get
    ..closeAllSnackbars()
    ..rawSnackbar(
      message: msg,
      backgroundColor: Colors.red,
    );
  showSuccess(msg) => Get
    ..closeAllSnackbars()
    ..rawSnackbar(
      message: msg,
      backgroundColor: Colors.green,
    );

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
