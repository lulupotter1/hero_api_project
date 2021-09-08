import 'dart:convert';
import 'package:hero_api_project/domain/model/hero_model.dart';
import 'package:hero_api_project/domain/repositories/constants.dart';
import 'package:http/http.dart' as http;

// https://superheroapi.com/api/access-token/search/name
// accessToken = '674430560615032'

class HeroApiProvider {
  Future<HeroModel> getHeroModel(String heroName) async {
    var url = Uri.https(
      Constants.weatherBaseUrlDomain,
      Constants.weatherForecastPath +
          Constants.accessToken +
          Constants.search +
          "/$heroName",
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return HeroModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
