import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_apex_dmit_ltd/app/modules/home/controllers/home_controller.dart';

class HomeAlert {
  viewAlert(HomeController controller) => Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          titlePadding: EdgeInsets.all(12),
          title: title(),
          content: content(controller),
        ),
      );

  content(HomeController controller) => Container(
        width: Get.width,
        height: 355,
        child: Column(
          children: [
            inputField(
              controller: controller.inputs['company-name']!,
              hintText: "Company Name",
            ),
            SizedBox(
              height: 12,
            ),
            inputField(
              controller: controller.inputs['email']!,
              hintText: "Work Email",
            ),
            SizedBox(
              height: 12,
            ),
            inputField(
              controller: controller.inputs['password']!,
              hintText: "Password",
            ),
            SizedBox(
              height: 12,
            ),
            inputField(
                controller: controller.inputs['phone']!,
                hintText: "Phone",
                keyboardType: TextInputType.phone),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 55,
              width: Get.width,
              child: Obx(() =>
                  controller.submitting.value == ApiCallStatus.FETCHING
                      ? Center(
                          child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff25A5A3)),
                          onPressed: () {
                            if (!validationError(controller)) {
                              controller.submitCompany();
                            }
                          },
                          child: Text("Create a New Company"))),
            )
          ],
        ),
      );

  bool validationError(HomeController controller) {
    if (controller.inputs['company-name']!.text.isEmpty) {
      controller.showError("Copany name required");
      return true;
    } else if (controller.inputs['email']!.text.isEmpty) {
      controller.showError("Email required");
      return true;
    } else if (controller.inputs['password']!.text.isEmpty) {
      controller.showError("Password required");
      return true;
    } else if (controller.inputs['phone']!.text.isEmpty) {
      controller.showError("Phone number required");
      return true;
    } else
      return false;
  }

  title() => Container(
        height: 60,
        child: Stack(children: [
          Positioned.fill(
            child: Center(
              child: Text(
                "Create a New Company",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey.shade800),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.close, color: Colors.grey.shade800),
            ),
          ),
        ]),
      );

  inputField(
          {required TextEditingController controller,
          required String hintText,
          TextInputType? keyboardType}) =>
      TextField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: inputBorder(),
          border: inputBorder(),
        ),
      );

  inputBorder() => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400, width: .5),
      );
}
