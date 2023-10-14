import 'package:application/constants/appcolor.dart';
import 'package:flutter/material.dart';

ElevatedButton CustomButton(
    {required void Function()? onPress, required String title}) {
  return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColor.continerColor,
        ),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ));
}
