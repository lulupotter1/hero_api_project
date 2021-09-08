import 'package:hero_api_project/domain/model/hero_model.dart';
import 'package:hero_api_project/domain/repositories/api_provider.dart';

class HeroRepository {
  HeroApiProvider _heroApiProvider = HeroApiProvider();

  Future<HeroModel> getHero(String heroName) =>
      _heroApiProvider.getHeroModel(heroName);
}
