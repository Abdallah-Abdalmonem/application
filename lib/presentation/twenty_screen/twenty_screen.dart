// import 'dart:io';

// import 'package:application/models/chemistry_model.dart';
// import 'package:application/models/coagulation.dart.dart';
// import 'package:application/widgets/custom_table_continer.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../constants/appcolor.dart';
// import '../../constants/image_constant.dart';
// import '../../models/hematology_model.dart';
// import '../../widgets/test.dart';

// class TwentyScreen extends StatelessWidget {
//   TwentyScreen({Key? key}) : super(key: key);
//   TextEditingController nameController = TextEditingController();

//   TextEditingController dateController = TextEditingController();
//   TextEditingController typeOfEchoController = TextEditingController();

//   File? fileImage;
//   var picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     Size mediaQuery = MediaQuery.of(context).size;
//     Map<String, dynamic> data =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     HematologyModel _hematology = data['hematology'];
//     CoagulationModel _coagulationModel = data['coagulation'];
//     ChemistryModel _chemistryModel = data['chemistry'];
//     File? fileImage = data['fileImage'];
//     String name = data['name'];
//     String date = data['date'];

//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: mediaQuery.width,
//           height: mediaQuery.height,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(0.49, 0),
//               end: Alignment(0.49, 1),
//               colors: [
//                 Color(0xff79C1C5),
//                 Color(0xffCEDFE6),
//               ],
//             ),
//           ),
//           child: Form(
//             // key: _formKey,
//             child: SingleChildScrollView(
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 25, right: 25, top: 70),
//                 child: Column(
//                   children: [
//                     const Divider(),
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(AppImages.imgPerson,
//                                 height: 30, width: 30),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Text(name),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               AppImages.imgDate,
//                               height: 25,
//                               width: 30,
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Text(date.substring(0, 10)),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         const Align(
//                           alignment: AlignmentDirectional.centerStart,
//                           child: Text(
//                             'Type of medical tests',
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       ],
//                     ),
//                     CustomTableContiner(
//                       categoryName: 'Hematology',
//                       table: Table(
//                         columnWidths: {
//                           3: FixedColumnWidth(10),
//                         },
//                         children: [
//                           CustomTableRow(
//                               title: 'HB',
//                               onTap: () {},
//                               isEnable: _hematology.HBIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'TLC',
//                               onTap: () {},
//                               isEnable: _hematology.TLCIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'ESR',
//                               onTap: () {},
//                               isEnable: _hematology.ESRIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'CRP',
//                               onTap: () {},
//                               isEnable: _hematology.CRPIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'Reticuloeytes',
//                               onTap: () {},
//                               isEnable: _hematology.ReticuloeytesIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'Lymph',
//                               onTap: () {},
//                               isEnable: _hematology.LymphIsEnable,
//                               controller: nameController),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTableContiner(
//                       categoryName: 'Chemistry',
//                       table: Table(
//                         children: [
//                           CustomTableRow(
//                               title: 'RBS',
//                               onTap: () {},
//                               isEnable: _chemistryModel.RBSEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'Cholesterol',
//                               onTap: () {},
//                               isEnable: _chemistryModel.CholesterolISEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'TGs',
//                               onTap: () {},
//                               isEnable: _chemistryModel.TGsISEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'CK',
//                               onTap: () {},
//                               isEnable: _chemistryModel.CKIsEnable,
//                               controller: nameController),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTableContiner(
//                       categoryName: 'Coagulation',
//                       table: Table(
//                         children: [
//                           CustomTableRow(
//                               title: 'PC',
//                               onTap: () {},
//                               isEnable: _coagulationModel.PCIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'PT',
//                               onTap: () {},
//                               isEnable: _coagulationModel.PTIsEnable,
//                               controller: nameController),
//                           CustomTableRow(
//                               title: 'LNR',
//                               onTap: () {},
//                               isEnable: _coagulationModel.LNRIsEnable,
//                               controller: nameController),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Align(
//                       alignment: AlignmentDirectional.centerStart,
//                       child: Text(
//                         'Type of Echo',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: AppColor.continerColor,
//                           borderRadius: BorderRadius.circular(15)),
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           if (fileImage != null)
//                             Image.file(
//                               fileImage,
//                               fit: BoxFit.cover,
//                               height: 80,
//                               width: double.infinity,
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.end,
//                     //   children: [
//                     //     InkWell(
//                     //       onTap: () {},
//                     //       child: Image.asset(
//                     //         AppImages.imgUploadImage,
//                     //         width: 20,
//                     //         height: 20,
//                     //       ),
//                     //     ),
//                     //     const SizedBox(width: 10),
//                     //     InkWell(
//                     //       onTap: () {
//                     //         // setState(() {
//                     //         //   fileImage = null;
//                     //         // });
//                     //       },
//                     //       child: Image.asset(
//                     //         AppImages.imgRemove,
//                     //         width: 20,
//                     //         height: 20,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const SizedBox(height: 10),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     CustomButton(
//                     //       onPress: () {},
//                     //       title: 'Send',
//                     //     ),
//                     //     CustomButton(
//                     //       onPress: () {},
//                     //       title: 'Following',
//                     //     ),
//                     //     CustomButton(
//                     //       onPress: () {},
//                     //       title: 'Order',
//                     //     ),
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
