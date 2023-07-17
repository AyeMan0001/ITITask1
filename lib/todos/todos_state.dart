part of 'todos_cubit.dart';



@immutable
abstract class todosState {}

class todosInitial extends todosState {}

class todosLoading extends todosState {}

class todosSuccess extends todosState {}

class todosError extends todosState {}
