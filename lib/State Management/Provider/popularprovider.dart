import 'package:bandspicker/State%20Management/Repository/popularrepository.dart';
import 'package:flutter/cupertino.dart';

import '../Model/popularmodel.dart';

class PopularProvider with ChangeNotifier{
  PopularRepository popularRepository = PopularRepository();
  bool loading = false;

  List<PopularModel> _PopularList = [];
  List<PopularModel> get PopularList => _PopularList;

  getPopularData() async{
    _PopularList = await popularRepository.getPopularDataList();
    notifyListeners();
  }
}