import 'package:flutter/widgets.dart';

import '../constants/constant/appcolor.dart';

Container CustomTableContiner(
    {required String categoryName, required Widget table}) {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xff85C2CB),
        borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child:
              Text(categoryName, style: const TextStyle(color: AppColor.white)),
        ),
        table,
      ],
    ),
  );
}
