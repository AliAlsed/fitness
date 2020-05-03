import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/model/excercises.dart';
import 'package:flutter/material.dart';

class ExerciseScrren extends StatefulWidget {
  Exercises exercises = Exercises();
  int seconds;
  ExerciseScrren({this.exercises, this.seconds});

  @override
  _ExerciseScrrenState createState() => _ExerciseScrrenState();
}

class _ExerciseScrrenState extends State<ExerciseScrren> {
  bool _isCompleted = false;
  int _elapsedSeconds = 0;

  AudioPlayer audioPlayer = AudioPlayer();

  AudioCache audioCache = AudioCache();

  void playSound() {
    audioCache.play("finished-task.mp3");
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();

        _isCompleted = true;

        playSound();
      }

      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Center(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image(image: AssetImage('assets/images/placeholder.png')),
                  imageUrl: widget.exercises.gif,
                  fit: BoxFit.contain,
                  width: width,
                ),
              ),
              _isCompleted != true
                  ? Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 120),
                      child: Text(
                        "$_elapsedSeconds/${widget.seconds} s",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ),
                    )
                  : Container(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
