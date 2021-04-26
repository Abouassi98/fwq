import 'package:flutter/material.dart';
import 'package:graduation_project/provider/shopsProvider.dart';

class CheckProvider with ChangeNotifier {
  List<Shops> shopsFilter = [];
  // List<Search> searchResults;
  String errorMessage;

  bool isLoading = false;
  TextEditingController controller = new TextEditingController();

  Future assignValueShops({List<Shops> shops}) async {
    await Future.delayed(Duration(seconds: 1), () {
      shopsFilter = shops;
    });
    notifyListeners();
  }

  // void searchResult(
  //     {List<Search> searchResultsparmter,
  //     TextEditingController controllerPamter,
  //     String errorMessagePramter,
  //     bool isLoadingParmter}) {
  //   searchResults = searchResultsparmter;
  //   controller = controllerPamter;
  //   errorMessage = errorMessagePramter;
  //   isLoading = isLoadingParmter;
  //   notifyListeners();
  // }
}
