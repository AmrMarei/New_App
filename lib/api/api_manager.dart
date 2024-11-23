import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=2f5f73197a8d4b2f8a61583b8c2bba96
   */
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourcesApi,
        {
          'apiKey': '2f5f73197a8d4b2f8a61583b8c2bba96',
          'category': categoryId,
        });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    }
    catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=2f5f73197a8d4b2f8a61583b8c2bba96
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi, {
      'apiKey': '2f5f73197a8d4b2f8a61583b8c2bba96',
      'sources': sourceId
    });
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    }
    catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsSearchBySourceId(String query) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi, {
      'apiKey': '2f5f73197a8d4b2f8a61583b8c2bba96',
      'q': query,
    });
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    }
    catch (e) {
      throw e;
    }
  }


}