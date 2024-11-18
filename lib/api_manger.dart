import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=9bcb81805e4548c2907c92fae66c24a6
     */
    Uri url = Uri.https(ApiConstants.beseUrl, ApiConstants.sourceApi,
        {"apiKey": "9bcb81805e4548c2907c92fae66c24a6", "category": categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;

      ///String
      var json = jsonDecode(bodyString);

      ///json
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    /*
     https://newsapi.org/v2/everything?apiKey=9bcb81805e4548c2907c92fae66c24a6
    */
    Uri url = Uri.https(ApiConstants.beseUrl, ApiConstants.newsApi,
        {"apiKey": "9bcb81805e4548c2907c92fae66c24a6", "sources": sourceId});
    try {
      var respone = await http.get(url);
      var bodyString = respone.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
