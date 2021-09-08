part of 'hero_bloc_bloc.dart';

@immutable
abstract class HeroBlocEvent {}

class SearchingHeroInformation extends HeroBlocEvent {
  final String heroName;

  SearchingHeroInformation({this.heroName});
}

class MainHeroInformation extends HeroBlocEvent {}
