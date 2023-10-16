import 'package:flutter/material.dart';

import '../constants/constant/appcolor.dart';

Widget CustomTableRow(
    {required String title,
    required bool isEnable,
    required VoidCallback onTap,
    void Function(String)? onChange,
    required TextEditingController controller,
    bool? readOnly,
    String? hintText,
    required BuildContext context}) {
  return Row(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          title,
          textScaleFactor: 1.2,
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: isEnable ? AppColor.colorEnable : Colors.white,
        ),
      ),
      const Spacer(),
      Container(
          margin: const EdgeInsets.only(right: 10),
          child: const FittedBox(
              alignment: AlignmentDirectional.center, child: Text('priority'))),
      SizedBox(
        height: 20,
        width: MediaQuery.of(context).size.width / 8,
        child: TextFormField(
          showCursor: false,
          style: const TextStyle(color: Colors.black),
          controller: controller,
          readOnly: readOnly ?? false,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
          ),
          textAlign: TextAlign.start,
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}

Widget CustomTableRowForTwentyScreen(
    {required String title,
    required bool isEnable,
    required String priority,
    required BuildContext context}) {
  return Row(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          title,
          textScaleFactor: 1.2,
        ),
      ),
      const Spacer(),
      CircleAvatar(
        radius: 10,
        backgroundColor: isEnable ? AppColor.colorEnable : Colors.white,
      ),
      const Spacer(),
      Container(
          margin: const EdgeInsets.only(right: 10),
          child: const FittedBox(
              alignment: AlignmentDirectional.center, child: Text('priority'))),
      Container(
        decoration: BoxDecoration(color: Colors.white),
        height: 20,
        width: MediaQuery.of(context).size.width / 8,
        child: Text(
          priority,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
