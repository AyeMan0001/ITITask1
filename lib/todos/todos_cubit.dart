import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';

part 'todos_state.dart';

class todosCubit extends Cubit<todosState> {
  todosCubit() : super(todosInitial()) {
    getUsers();
  }

  List<Welcome> users = [];
  bool isLoading = true;

  getUsers() async {
    emit(todosLoading());
    try {
      users = await todoService().gettodosData();
      isLoading = false;

      emit(todosSuccess());
    } catch (e) {
      print(e.toString());
      emit(todosError());
    }
  }
}
