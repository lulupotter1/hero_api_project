import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_api_project/bloc/hero_bloc_bloc.dart';
// import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

class StartWidget extends StatelessWidget {
  final TextEditingController heroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgroundImageInTheMainScreen.jpg"),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF238DFE).withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Search your hero',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF238DFE).withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: heroController,
                onEditingComplete: () {
                  if (heroController.text != null &&
                      heroController.text != " " &&
                      heroController.text != "") {
                    BlocProvider.of<HeroBlocBloc>(context).add(
                        SearchingHeroInformation(
                            heroName: heroController.text));
                  }
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(style: BorderStyle.solid)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(style: BorderStyle.solid)),
                    hintText: "Character name",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold)
                    // hintStyle: TextStyle(),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
