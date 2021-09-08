import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_api_project/domain/model/hero_model.dart';

class SelectedHeroPage extends StatefulWidget {
  final Results recievedData;
  SelectedHeroPage({this.recievedData}) : super();

  @override
  _SelectedHeroPageState createState() =>
      _SelectedHeroPageState(recievedData: recievedData);
}

class _SelectedHeroPageState extends State<SelectedHeroPage> {
  final Results recievedData;
  _SelectedHeroPageState({this.recievedData}) : super();
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('${recievedData.name}(${recievedData.biography.fullName})'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Int - ${recievedData.powerstats.intelligence}'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('Str - ${recievedData.powerstats.strength}'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('Spd - ${recievedData.powerstats.speed}'),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(recievedData.image.url),
                      radius: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Dur - ${recievedData.powerstats.durability}'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('Pow - ${recievedData.powerstats.power}'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('Com - ${recievedData.powerstats.combat}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('${recievedData.biography.fullName}'),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myGestureDetector('Biography'),
                  myGestureDetector('Appearance'),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myGestureDetector('Work'),
                  myGestureDetector('Connections')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector myGestureDetector(String text) {
    return GestureDetector(
      onTap: () {
        createAlertDialog(context, text);
      },
      child: Container(
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.amber, border: Border.all(color: Colors.black)),
        child: Center(child: Text(text)),
      ),
    );
  }

  createAlertDialog(BuildContext context, String text) {
    Column widget;
    if (text == 'Biography') {
      widget = bioColumn();
    } else if (text == 'Appearance') {
      widget = appearenceColumn();
    } else if (text == 'Work') {
      widget = workColumn();
    } else if (text == 'Connections') {
      widget = connectionColumn();
    }
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 24.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget,
            ),
          );
        });
  }

  Column bioColumn() {
    return Column(
      children: [
        Text('Full-name: ${recievedData.biography.fullName}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Alter-egos: ${recievedData.biography.alterEgos}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Alignment: ${recievedData.biography.alignment}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Place-of-birth: ${recievedData.biography.placeOfBirth}'),
        SizedBox(
          height: 10.0,
        ),
        Text('First-appearance: ${recievedData.biography.firstAppearance}'),
        SizedBox(
          height: 50.0,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(width: 2.0)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: recievedData.biography.aliases.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child:
                    Text('${recievedData.biography.aliases[index].characters}'),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text('Publisher: ${recievedData.biography.publisher}'),
      ],
    );
  }

  Column appearenceColumn() {
    return Column(
      children: [
        Text('Gender: ${recievedData.appearance.gender}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Race: ${recievedData.appearance.race}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Height: ${recievedData.appearance.height[1]}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Weight: ${recievedData.appearance.weight[1]}'),
      ],
    );
  }

  Column workColumn() {
    return Column(
      children: [
        Text('Occupation: ${recievedData.work.occupation}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Base: ${recievedData.work.base}'),
      ],
    );
  }

  Column connectionColumn() {
    return Column(
      children: [
        Text('Group-affilation: ${recievedData.connections.groupAffiliation}'),
        SizedBox(
          height: 10.0,
        ),
        Text('Relatives: ${recievedData.connections.relatives}'),
      ],
    );
  }
}
