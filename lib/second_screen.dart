import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/todo_model.dart';
import 'package:untitled/services/todo_service.dart';
import 'package:untitled/todos/todos_cubit.dart';
import 'package:untitled/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
        body : BlocProvider(
          create: (context) => todosCubit(),
          child: BlocBuilder<todosCubit, todosState>(
            // BlocConsumer<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is todosLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is todosSuccess) {
                return ListView.builder(
                  itemCount: context.watch<todosCubit>().users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(context.watch<todosCubit>().users[index].title ?? "--"),
                      subtitle: Text(context.watch<todosCubit>().users[index].completed.toString() ?? "--"),
                      trailing: Icon(Icons.book),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Error in this screen"),
                );
              }
            },
          ),
        )
    );
  }


}
