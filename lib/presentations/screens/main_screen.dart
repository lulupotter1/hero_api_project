import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_api_project/bloc/hero_bloc_bloc.dart';
import 'package:hero_api_project/presentations/screens/setting_page.dart';
import 'package:hero_api_project/presentations/widgets/loaded_hero_widget.dart';
import 'package:hero_api_project/presentations/widgets/start_page_widget.dart';

class MainHeroScreen extends StatelessWidget {
  const MainHeroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hero App'),
        leading: IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () {
            BlocProvider.of<HeroBlocBloc>(context).add(MainHeroInformation());
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsPage(
                              themeMode: themeMode,
                            )));
              })
        ],
      ),
      body: BlocBuilder<HeroBlocBloc, HeroBlocState>(
        builder: (context, state) {
          if (state is HeroBlocInitial) {
            return StartWidget();
          }

          if (state is HeroInfoIsLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is HeroInfoIsLoaded) {
            if (state.recievedData.response == 'success') {
              return LoadedHeroWidget(recievedData: state.recievedData);
            } else
              return Center(
                  child: Text(
                '${state.recievedData.error}',
                style: TextStyle(fontSize: 20.0),
              ));
          }
          return Center(child: Text('null Exception'));
        },
      ),
    );
  }
}
