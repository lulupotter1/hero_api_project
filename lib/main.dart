import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_api_project/bloc/hero_bloc_bloc.dart';
import 'package:hero_api_project/presentations/screens/main_screen.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

void main() {
  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HeroBlocBloc>(
        create: (context) => HeroBlocBloc(),
        child: MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: EasyDynamicTheme.of(context).themeMode,
          home: MainHeroScreen(),
        ));
  }
}
