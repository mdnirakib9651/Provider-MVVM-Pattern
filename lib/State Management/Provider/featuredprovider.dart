import 'package:bandspicker/State%20Management/Repository/featuredrepository.dart';
import 'package:flutter/cupertino.dart';

import '../Model/featuredmodel.dart';

class FeaturedProvider with ChangeNotifier{
  FeaturedRepository featuredRepository = FeaturedRepository();
  bool loading = false;

  List<FeaturedModel> _FeaturedList = [];
  List<FeaturedModel> get FeaturedList => _FeaturedList;

  getFeaturedData() async{
    _FeaturedList = await featuredRepository.getFeaturedDataList();
    notifyListeners();
  }
}