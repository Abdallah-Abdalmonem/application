// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:application/models/coagulation.dart.dart';
import 'package:application/constants/routes/app_routes.dart';
import 'package:application/widgets/custom_button.dart';
import 'package:application/widgets/custom_table_continer.dart';
import 'package:application/widgets/custom_table_row.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:application/widgets/custom_text_form_field.dart';

import '../../constants/appcolor.dart';
import '../../constants/image_constant.dart';
import '../../models/chemistry_model.dart';
import '../../models/hematology_model.dart';
import '../../widgets/test.dart';

class NineteenScreen extends StatefulWidget {
  NineteenScreen({Key? key}) : super(key: key);

  @override
  State<NineteenScreen> createState() => _NineteenScreenState();
}

class _NineteenScreenState extends State<NineteenScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  TextEditingController _hematologyController1 = TextEditingController();
  TextEditingController _hematologyController2 = TextEditingController();
  TextEditingController _hematologyController3 = TextEditingController();
  TextEditingController _hematologyController4 = TextEditingController();
  TextEditingController _hematologyController5 = TextEditingController();
  TextEditingController _hematologyController6 = TextEditingController();

  DateTime? selectedDate;
  TextEditingController typeOfEchoController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  HematologyModel? _hematologyModel = HematologyModel(
      HBIsEnable: false,
      CRPIsEnable: false,
      ESRIsEnable: false,
      LymphIsEnable: false,
      ReticuloeytesIsEnable: false,
      TLCIsEnable: false);

  CoagulationModel _coagulationModel = CoagulationModel(
    PCIsEnable: false,
    PTIsEnable: false,
    LNRIsEnable: false,
  );

  ChemistryModel _chemistryModel = ChemistryModel(
    CKIsEnable: false,
    CholesterolISEnable: false,
    RBSEnable: false,
    TGsISEnable: false,
  );

  File? fileImage;
  var picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    Future<void> getProfileImage() async {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        fileImage = File(pickedFile.path);
        print(pickedFile.path);
        setState(() {});
      } else {
        print('No image selected.');
      }
    }

    List hematologyList = [
      CustomTableRow(
          title: 'HB',
          onTap: () {
            setState(() {
              _hematologyModel!.HBIsEnable = !_hematologyModel!.HBIsEnable;
            });
          },
          isEnable: _hematologyModel!.HBIsEnable,
          controller: _hematologyController1,
          context: context),
      CustomTableRow(
          title: 'TLC',
          onTap: () {
            setState(() {
              _hematologyModel!.TLCIsEnable = !_hematologyModel!.TLCIsEnable;
            });
          },
          isEnable: _hematologyModel!.TLCIsEnable,
          controller: _hematologyController2,
          context: context),
      CustomTableRow(
          title: 'ESR',
          onTap: () {
            setState(() {
              _hematologyModel!.ESRIsEnable = !_hematologyModel!.ESRIsEnable;
            });
          },
          isEnable: _hematologyModel!.ESRIsEnable,
          controller: _hematologyController3,
          context: context),
      CustomTableRow(
          title: 'CRP',
          onTap: () {
            setState(() {
              _hematologyModel!.CRPIsEnable = !_hematologyModel!.CRPIsEnable;
            });
          },
          isEnable: _hematologyModel!.CRPIsEnable,
          controller: _hematologyController4,
          context: context),
      CustomTableRow(
          title: 'Reticuloeytes',
          onTap: () {
            setState(() {
              _hematologyModel!.ReticuloeytesIsEnable =
                  !_hematologyModel!.ReticuloeytesIsEnable;
            });
          },
          isEnable: _hematologyModel!.ReticuloeytesIsEnable,
          controller: _hematologyController5,
          context: context),
      CustomTableRow(
          title: 'Lymph',
          onTap: () {
            setState(() {
              _hematologyModel!.LymphIsEnable =
                  !_hematologyModel!.LymphIsEnable;
            });
          },
          isEnable: _hematologyModel!.LymphIsEnable,
          controller: _hematologyController6,
          context: context),
    ];
    List coagulationList = [
      CustomTableRow(
          title: 'PC',
          onTap: () {
            setState(() {
              _coagulationModel.PCIsEnable = !_coagulationModel.PCIsEnable;
            });
          },
          isEnable: _coagulationModel.PCIsEnable,
          controller: tempController,
          context: context),
      CustomTableRow(
          title: 'PT',
          onTap: () {
            setState(() {
              _coagulationModel.PTIsEnable = !_coagulationModel.PTIsEnable;
            });
          },
          isEnable: _coagulationModel.PTIsEnable,
          controller: tempController,
          context: context),
      CustomTableRow(
          title: 'LNR',
          onTap: () {
            setState(() {
              _coagulationModel.LNRIsEnable = !_coagulationModel.LNRIsEnable;
            });
          },
          isEnable: _coagulationModel.LNRIsEnable,
          controller: tempController,
          context: context),
    ];
    List chemistryList = [
      CustomTableRow(
          title: 'RBS',
          onTap: () {
            setState(() {
              _chemistryModel.RBSEnable = !_chemistryModel.RBSEnable;
            });
          },
          isEnable: _chemistryModel.RBSEnable,
          controller: tempController,
          context: context),
      CustomTableRow(
          title: 'Cholesterol',
          onTap: () {
            setState(() {
              _chemistryModel.CholesterolISEnable =
                  !_chemistryModel.CholesterolISEnable;
            });
          },
          isEnable: _chemistryModel.CholesterolISEnable,
          controller: tempController,
          context: context),
      CustomTableRow(
          title: 'TGs',
          onTap: () {
            setState(() {
              _chemistryModel.TGsISEnable = !_chemistryModel.TGsISEnable;
            });
          },
          isEnable: _chemistryModel.TGsISEnable,
          controller: tempController,
          context: context),
      CustomTableRow(
          title: 'CK',
          onTap: () {
            setState(() {
              _chemistryModel.CKIsEnable = !_chemistryModel.CKIsEnable;
            });
          },
          isEnable: _chemistryModel.CKIsEnable,
          controller: tempController,
          context: context),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.49, 0),
              end: Alignment(0.49, 1),
              colors: [
                Color(0xff79C1C5),
                Color(0xffCEDFE6),
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 70),
                child: Column(
                  children: [
                    const Divider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.imgPerson,
                                height: 30, width: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextFormField(
                                controller: nameController,
                                margin: const EdgeInsets.only(left: 1),
                                hintText: "patient name",
                                textInputType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate ??
                                  DateTime.now(), // Refer step 1
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            );
                            if (picked != null && picked != selectedDate)
                              setState(() {
                                selectedDate = picked;
                              });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.imgDate,
                                height: 25,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  margin: const EdgeInsets.only(left: 1),
                                  hintText: selectedDate == null
                                      ? "Date"
                                      : selectedDate
                                          .toString()
                                          .substring(0, 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Type of medical tests',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    CustomTableContiner(
                      categoryName: 'Hematology',
                      table: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hematologyList.length,
                        itemBuilder: (context, index) => hematologyList[index],
                        shrinkWrap: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTableContiner(
                      categoryName: 'Coagulation',
                      table: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: coagulationList.length,
                        itemBuilder: (context, index) => coagulationList[index],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTableContiner(
                      categoryName: 'Chemistry',
                      table: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: chemistryList.length,
                        itemBuilder: (context, index) => chemistryList[index],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Type of Echo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.continerColor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomTextFormField(
                              controller: typeOfEchoController,
                              hintText: 'Write the type and upload pictures',
                              textStyle: fileImage != null
                                  ? const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)
                                  : null,
                              fillColor: AppColor.continerColor,
                              filled: true,
                            ),
                          ),
                          if (fileImage != null)
                            Image.file(
                              fileImage!,
                              fit: BoxFit.cover,
                              height: 80,
                              width: double.infinity,
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            getProfileImage();
                          },
                          child: Image.asset(
                            AppImages.imgUploadImage,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fileImage = null;
                            });
                          },
                          child: Image.asset(
                            AppImages.imgRemove,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPress: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.twentyScreen,
                              arguments: {
                                'name': nameController.text.toString(),
                                'date': selectedDate.toString(),
                                'hematology': _hematologyModel,
                                'coagulation': _coagulationModel,
                                'chemistry': _chemistryModel,
                                'fileImage': fileImage,
                              },
                            );
                          },
                          title: 'Send',
                        ),
                        CustomButton(
                          onPress: () {},
                          title: 'Following',
                        ),
                        CustomButton(
                          onPress: () {},
                          title: 'Order',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}