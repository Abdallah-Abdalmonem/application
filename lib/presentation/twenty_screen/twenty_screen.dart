import 'dart:io';

import 'package:application/models/chemistry_model.dart';
import 'package:application/models/coagulation.dart.dart';
import 'package:application/widgets/custom_table_continer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/appcolor.dart';
import '../../constants/image_constant.dart';
import '../../models/hematology_model.dart';
import '../../widgets/test.dart';

class TwentyScreen extends StatefulWidget {
  TwentyScreen({Key? key}) : super(key: key);

  @override
  State<TwentyScreen> createState() => _TwentyScreenState();
}

class _TwentyScreenState extends State<TwentyScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController typeOfEchoController = TextEditingController();

  File? fileImage;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    HematologyModel _hematology = data['hematology'];
    CoagulationModel _coagulationModel = data['coagulation'];
    ChemistryModel _chemistryModel = data['chemistry'];
    File? fileImage = data['fileImage'];
    String name = data['name'];
    String date = data['date'];

    List hematologyList = [
      CustomTableRow(
          title: 'HB',
          onTap: () {},
          isEnable: _hematology.HBIsEnable,
          controller: nameController,
          readOnly: true,
          context: context),
      CustomTableRow(
          readOnly: true,
          title: 'TLC',
          onTap: () {},
          isEnable: _hematology.TLCIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          readOnly: true,
          title: 'ESR',
          onTap: () {},
          isEnable: _hematology.ESRIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'CRP',
          readOnly: true,
          onTap: () {},
          isEnable: _hematology.CRPIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          readOnly: true,
          title: 'Reticuloeytes',
          onTap: () {},
          isEnable: _hematology.ReticuloeytesIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          readOnly: true,
          title: 'Lymph',
          onTap: () {},
          isEnable: _hematology.LymphIsEnable,
          controller: nameController,
          context: context),
    ];
    List coagulationList = [
      CustomTableRow(
          title: 'RBS',
          onTap: () {},
          isEnable: _chemistryModel.RBSEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'Cholesterol',
          onTap: () {},
          isEnable: _chemistryModel.CholesterolISEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'TGs',
          onTap: () {},
          isEnable: _chemistryModel.TGsISEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'CK',
          onTap: () {},
          isEnable: _chemistryModel.CKIsEnable,
          controller: nameController,
          context: context),
    ];
    List chemistryList = [
      CustomTableRow(
          title: 'PC',
          onTap: () {},
          isEnable: _coagulationModel.PCIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'PT',
          onTap: () {},
          isEnable: _coagulationModel.PTIsEnable,
          controller: nameController,
          context: context),
      CustomTableRow(
          title: 'LNR',
          onTap: () {},
          isEnable: _coagulationModel.LNRIsEnable,
          controller: nameController,
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
            // key: _formKey,
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
                              child: Text(name),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.imgDate,
                              height: 25,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(date.substring(0, 10)),
                            ),
                          ],
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: hematologyList.length,
                        itemBuilder: (context, index) => hematologyList[index],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTableContiner(
                        categoryName: 'Chemistry',
                        table: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: hematologyList.length,
                          itemBuilder: (context, index) =>
                              hematologyList[index],
                        )),
                    const SizedBox(height: 20),
                    CustomTableContiner(
                      categoryName: 'Coagulation',
                      table: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: coagulationList.length,
                        itemBuilder: (context, index) => coagulationList[index],
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
                          if (fileImage != null)
                            Image.file(
                              fileImage,
                              fit: BoxFit.cover,
                              height: 80,
                              width: double.infinity,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
