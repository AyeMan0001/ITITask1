import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/todo_model.dart';
import 'package:untitled/services/todo_service.dart';
import 'package:untitled/utils.dart';


class SecondScreen extends StatefulWidget {
  final String email;
  const SecondScreen({super.key,required this.email});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Welcome> todos = [];
  bool isLoading = true;

  gettodos() async {
    todos = await todoService().gettodosData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gettodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body : isLoading
            ? Center(
          child: CircularProgressIndicator()
        )
            : ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(todos[index].title ?? "--"),
              subtitle: Text(todos[index].completed.toString()),
              trailing: Icon(Icons.today_outlined),
            );
          },
        )
    );
  }
    }
