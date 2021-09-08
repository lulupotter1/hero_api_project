import 'package:flutter/material.dart';
import 'package:hero_api_project/domain/model/hero_model.dart';
import 'package:hero_api_project/presentations/screens/selected_hero_page.dart';

class LoadedHeroWidget extends StatelessWidget {
  final HeroModel recievedData;
  LoadedHeroWidget({this.recievedData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recievedData.results.length,
        itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (SelectedHeroPage(
                                recievedData: recievedData.results[index],
                              ))));
                },
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                recievedData.results[index].image.url)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${recievedData.results[index].name}(${recievedData.results[index].biography.fullName})'),
                              Text('${recievedData.results[index].work.base}'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
