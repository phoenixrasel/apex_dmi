import 'package:flutter/material.dart';
import 'package:test_apex_dmit_ltd/app/modules/home/controllers/home_controller.dart';
import 'package:test_apex_dmit_ltd/app/modules/home/views/componen/home_alert.dart';

class HomeComponent {
  HomeController controller;
  HomeComponent({required this.controller});

  /**
   * data list widget
   * return list of data widget
   */
  dataWidget() => ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (bCtx, index) => Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade400, width: .3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.data[index]['company_name'] ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              lightText(controller.data[index]['email'] ?? ""),
              SizedBox(
                height: 3,
              ),
              lightText(controller.data[index]['phone'] ?? ""),
            ],
          ),
        ),
      );

  /**
   * common text widget as [lightText] 
   * return Text with custom text style
   */
  lightText(text) => Text(text,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ));

  /**
   * -- [floatingBtn] return default floating buttton with extended label
   * @ on pressed will view a alert
   */
  floatingBtn() => FloatingActionButton.extended(
        backgroundColor: Color(0xff25A5A3),
        onPressed: () {
          HomeAlert().viewAlert(controller);
        },
        label: Text("Create Company"),
      );
}
