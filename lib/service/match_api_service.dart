import 'dart:convert';

import 'package:cricket_score/model_class/score_api_response.dart';
import 'package:cricket_score/util/api_endpoints.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class MatchApiService {

  static Future<ScoreApiResponse> getMatchInformation() async {
    http:Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),

      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );
    if (response.statusCode == 200) {
      print(response.body);

      final result = jsonDecode(response.body);

      return ScoreApiResponse.fromJson(result);

    }
    else{
      throw 'Somthing went wrong';
    }
  }
}