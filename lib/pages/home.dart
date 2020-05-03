import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/helpers/network.dart';
import 'package:fitness/model/excercises.dart';
import 'package:fitness/pages/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  NetworkHelper networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    networkHelper.getExercises();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: WillPopScope(
        child: Container(
          child: FutureBuilder(
              future: networkHelper.getExercises(),
              builder:
                  (BuildContext context, AsyncSnapshot<ExerciseModel> snap) {
                if (snap.data == null) {
                  return LinearProgressIndicator();
                } else {
                  return ListView.builder(
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    Duration(milliseconds: 1000),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return ExercisDetail(
                                    exercises: snap.data.exercises[index],
                                  );
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return Align(
                                    // child: FadeTransition(
                                    //   opacity: animation,
                                    //   child: child,
                                    // ),
                                    child: SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );

                            //       pageBuilder: (_, __, ___) => ),
                            // );
                          },
                          child: Hero(
                            tag: snap.data.exercises[index].id,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 260,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Image(
                                          image: AssetImage(
                                              'assets/images/placeholder.png')),
                                      imageUrl:
                                          snap.data.exercises[index].thumbnail,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 260,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center,
                                              colors: [
                                            Color(0XFF000000),
                                            Color(0X00000000)
                                          ])),
                                    ),
                                  ),
                                  Container(
                                    height: 260,
                                    alignment: Alignment.bottomLeft,
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 20),
                                    child: Text(
                                      snap.data.exercises[index].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snap.data.exercises.length);
                }
              }),
        ),
        onWillPop: () {
          SystemNavigator.pop();
        },
      ),
    );
  }
}
