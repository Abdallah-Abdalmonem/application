// import 'package:flutter/material.dart';

// import '../constants/appcolor.dart';

// TableRow CustomTableRow(
//     {required String title,
//     required bool isEnable,
//     required VoidCallback onTap,
//     required TextEditingController controller}) {
//   return TableRow(
//     children: [
//       // FittedBox(
//       //   fit: BoxFit.cover,
//       // child:
//       Text(
//         title,
//         // style: const TextStyle(fontSize: 2),
//         textScaleFactor: 1.2,
//       ),
//       // ),
//       const SizedBox(width: 0),
//       InkWell(
//         onTap: onTap,
//         child: CircleAvatar(
//           radius: 10,
//           backgroundColor: isEnable ? AppColor.colorEnable : Colors.white,
//         ),
//       ),
//       const SizedBox(width: 0),
//       Container(
//           margin: const EdgeInsets.only(right: 10),
//           child: const FittedBox(
//               alignment: AlignmentDirectional.center, child: Text('priority'))),
//       SizedBox(
//         height: 20,
//         width: 30,
//         child: TextFormField(
//           showCursor: false,
//           style: const TextStyle(color: Colors.black),
//           controller: controller,
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             fillColor: Colors.white,
//             filled: true,
//           ),
//           textAlign: TextAlign.start,
//           keyboardType: TextInputType.number,
//         ),
//       ),
//     ],
//   );
// }
