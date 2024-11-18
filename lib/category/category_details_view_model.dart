import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sourceList;

  String? errorMessage;

  void getSourceByCategory(String categoryId) async {
    sourceList = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == "error") {
        errorMessage = response.message;
      } else {
        ///status = ok
        sourceList = response.sources;
      }
    } catch (e) {
      errorMessage = "Error loading source list";
    }
    notifyListeners();
  }
}
