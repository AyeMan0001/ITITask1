import 'package:dio/dio.dart';
import 'package:untitled/models/todo_model.dart';

class todoService {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Welcome>> gettodosData() async {
    List<Welcome> todosList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      Welcome todo = Welcome.fromJson(jsonElement);
      todosList.add(todo);
    });
    return todosList;
  }
}
