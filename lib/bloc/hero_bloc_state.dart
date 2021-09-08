part of 'hero_bloc_bloc.dart';

@immutable
abstract class HeroBlocState {}

class HeroBlocInitial extends HeroBlocState {}

class HeroInfoIsLoading extends HeroBlocState {}

class HeroInfoIsLoaded extends HeroBlocState {
  final HeroModel recievedData;
  HeroInfoIsLoaded({@required this.recievedData});
}

class InfoIsNotLoaded extends HeroBlocState {}

class InfoError extends HeroBlocState {}
