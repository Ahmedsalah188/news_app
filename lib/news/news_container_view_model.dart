import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier {
  List<News>? newsList;

  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == "error") {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = "Error Loading News List";
    }
    notifyListeners();
  }
}
