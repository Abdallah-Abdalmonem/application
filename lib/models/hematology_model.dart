// ignore_for_file: public_member_api_docs, sort_constructors_first
class HematologyModel {
  bool HBIsEnable = false;
  bool TLCIsEnable = false;
  bool ESRIsEnable = false;
  bool CRPIsEnable = false;
  bool ReticuloeytesIsEnable = false;
  bool LymphIsEnable = false;

  HematologyModel({
    required this.HBIsEnable,
    required this.TLCIsEnable,
    required this.ESRIsEnable,
    required this.CRPIsEnable,
    required this.ReticuloeytesIsEnable,
    required this.LymphIsEnable,
  });
}

class priority {
  List<int> list = [];
  priority({
    required this.list,
  });
}
