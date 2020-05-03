import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/model/excercises.dart';
import 'package:fitness/pages/ExerciseScreen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExercisDetail extends StatelessWidget {
  Exercises exercises = Exercises();
  ExercisDetail({this.exercises});
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: width,
      height: height,
      child: Hero(
          tag: exercises.id,
          child: Stack(children: <Widget>[
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Image(image: AssetImage('assets/images/placeholder.png')),
              imageUrl: exercises.thumbnail,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0XFF000000), Color(0X00000000)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center)),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                width: width * 0.25,
                height: height * 0.2,
                child: SleekCircularSlider(
                    initialValue: seconds.toDouble(),
                    min: 10,
                    max: 60,
                    appearance: CircularSliderAppearance(),
                    innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text('$seconds s',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none)),
                      );
                    },
                    onChange: (double value) {
                      seconds = value.toInt();
                    }),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExerciseScrren(
                        exercises: exercises,
                        seconds: seconds,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Start Exercise',
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: Colors.black,
                color: Color(0xFFE83350),
              ),
            ),
          ])),
    ));
  }
}
