import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

class SettingsPage extends StatefulWidget {
  final ThemeMode themeMode;
  SettingsPage({@required this.themeMode}) : super();

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  String _onOrOff;
  final ThemeMode themeMode;

  _SettingPageState({this.themeMode});

  @override
  void initState() {
    super.initState();
    if (themeMode == ThemeMode.dark) {
      _onOrOff = 'on';
    } else {
      _onOrOff = 'off';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.palette),
                        SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          children: [
                            Text('Dark theme'),
                            Text('Turn $_onOrOff'),
                          ],
                        )
                      ],
                    )),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Dark theme'),
                          content: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    EasyDynamicTheme.of(context)
                                        .changeTheme(dark: true);

                                    setState(() {
                                      _onOrOff = 'on';
                                    });
                                  },
                                  child: Text('Dark theme')),
                              TextButton(
                                  onPressed: () {
                                    EasyDynamicTheme.of(context)
                                        .changeTheme(dark: false);

                                    setState(() {
                                      _onOrOff = 'off';
                                    });
                                  },
                                  child: Text('Light theme'))
                            ],
                          ),
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
