import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_api_project/domain/model/hero_model.dart';
// import 'package:hero_api_project/domain/repositories/api_provider.dart';
import 'package:hero_api_project/domain/repositories/hero_reposit.dart';
import 'package:meta/meta.dart';

part 'hero_bloc_event.dart';
part 'hero_bloc_state.dart';

class HeroBlocBloc extends Bloc<HeroBlocEvent, HeroBlocState> {
  HeroBlocBloc() : super(HeroBlocInitial());

  @override
  Stream<HeroBlocState> mapEventToState(
    HeroBlocEvent event,
  ) async* {
    final HeroRepository heroRepository = HeroRepository();

    if (event is SearchingHeroInformation) {
      yield HeroInfoIsLoading();

      try {
        final HeroModel _loadedHeroInformation =
            await heroRepository.getHero(event.heroName);
        yield HeroInfoIsLoaded(recievedData: _loadedHeroInformation);
      } catch (_) {
        yield InfoError();
      }
    }

    if (event is MainHeroInformation) {
      yield HeroBlocInitial();
    }
  }
}
