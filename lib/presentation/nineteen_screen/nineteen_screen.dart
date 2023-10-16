import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constant/appcolor.dart';
import '../../constants/constant/image_constant.dart';
import '../../constants/routes/app_routes.dart';
import '../../models/chemistry_model.dart';
import '../../models/coagulation.dart.dart';
import '../../models/hematology_model.dart';
import '../../models/row_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_table_continer.dart';
import '../../widgets/custom_table_row.dart';
import '../../widgets/custom_text_form_field.dart';
import '../twenty_screen/twenty_screen.dart';

class NineteenScreen extends StatefulWidget {
  NineteenScreen({Key? key}) : super(key: key);

  @override
  State<NineteenScreen> createState() => _NineteenScreenState();
}

class _NineteenScreenState extends State<NineteenScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  final TextEditingController _hematologyController1 = TextEditingController();
  final TextEditingController _hematologyController2 = TextEditingController();
  final TextEditingController _hematologyController3 = TextEditingController();
  final TextEditingController _hematologyController4 = TextEditingController();
  final TextEditingController _hematologyController5 = TextEditingController();
  final TextEditingController _hematologyController6 = TextEditingController();

  DateTime? selectedDate;
  TextEditingController typeOfEchoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final HematologyModel? _hematologyModel = HematologyModel(
      HBIsEnable: false,
      CRPIsEnable: false,
      ESRIsEnable: false,
      LymphIsEnable: false,
      ReticuloeytesIsEnable: false,
      TLCIsEnable: false);

  final CoagulationModel _coagulationModel = CoagulationModel(
    PCIsEnable: false,
    PTIsEnable: false,
    LNRIsEnable: false,
  );

  final ChemistryModel _chemistryModel = ChemistryModel(
    CKIsEnable: false,
    CholesterolISEnable: false,
    RBSEnable: false,
    TGsISEnable: false,
  );

  List<CustomModel> itemModel = [
    CustomModel(text: 'HB'),
    CustomModel(text: 'TLC'),
    CustomModel(text: 'ESR'),
    CustomModel(text: 'CRP'),
    CustomModel(text: 'Reticuloeytes'),
    CustomModel(text: 'Lymph'),
  ];

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
              itemModel[0].isSelected = _hematologyModel!.HBIsEnable;
              if (!_hematologyModel!.HBIsEnable) {
                _hematologyController1.clear();
                itemModel[0].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[0].prority = int.parse(text);
          },
          isEnable: _hematologyModel!.HBIsEnable,
          controller: _hematologyController1,
          context: context),
      CustomTableRow(
          title: 'TLC',
          onTap: () {
            setState(() {
              _hematologyModel!.TLCIsEnable = !_hematologyModel!.TLCIsEnable;
              itemModel[1].isSelected = _hematologyModel!.TLCIsEnable;
              if (!_hematologyModel!.TLCIsEnable) {
                _hematologyController2.clear();
                itemModel[1].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[1].prority = int.parse(text);
          },
          isEnable: _hematologyModel!.TLCIsEnable,
          controller: _hematologyController2,
          context: context),
      CustomTableRow(
          title: 'ESR',
          onTap: () {
            setState(() {
              _hematologyModel!.ESRIsEnable = !_hematologyModel!.ESRIsEnable;
              itemModel[2].isSelected = _hematologyModel!.ESRIsEnable;
              if (!_hematologyModel!.ESRIsEnable) {
                _hematologyController3.clear();
                itemModel[2].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[2].prority = int.parse(text);
          },
          isEnable: _hematologyModel!.ESRIsEnable,
          controller: _hematologyController3,
          context: context),
      CustomTableRow(
          title: 'CRP',
          onTap: () {
            setState(() {
              _hematologyModel!.CRPIsEnable = !_hematologyModel!.CRPIsEnable;
              itemModel[3].isSelected = _hematologyModel!.CRPIsEnable;
              if (!_hematologyModel!.CRPIsEnable) {
                _hematologyController4.clear();
                itemModel[3].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[3].prority = int.parse(text);
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
              itemModel[4].isSelected = _hematologyModel!.ReticuloeytesIsEnable;
              if (!_hematologyModel!.ReticuloeytesIsEnable) {
                _hematologyController5.clear();
                itemModel[4].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[4].prority = int.parse(text);
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

              itemModel[5].isSelected = _hematologyModel!.LymphIsEnable;
              if (!_hematologyModel!.LymphIsEnable) {
                _hematologyController6.clear();
                itemModel[5].prority = 0;
              }
            });
          },
          onChange: (text) {
            itemModel[5].prority = int.parse(text);
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await reorderList(itemModel);
          },
          icon: Icon(Icons.abc_rounded),
        ),
      ),
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
                                'list': reorderList(itemModel),
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

List<CustomModel> reorderList(List<CustomModel> list) {
  List<CustomModel> OrderedList = list;
  OrderedList[0] = list[0];

  OrderedList.sort((a, b) => b.prority.compareTo(a.prority));
  for (var i = 0; i < OrderedList.length; i++) {
    print(
        '${OrderedList[i].text} ${OrderedList[i].isSelected} ${OrderedList[i].prority}');
  }
  return OrderedList;
}
