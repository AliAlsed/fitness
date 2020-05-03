import 'dart:convert';

import 'package:fitness/model/excercises.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  Future<ExerciseModel> excierciseModel;

  Future<ExerciseModel> getExercises() async {
    ExerciseModel model = ExerciseModel();
    http.Response response = await http.get(url);

    Map res = json.decode(response.body);

    model = ExerciseModel.fromJson(res);
    print(model.exercises.length);
    return model;
  }
}
