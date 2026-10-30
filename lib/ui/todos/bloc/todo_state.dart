part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState{}

final class ErrosTodoState extends TodoState{}

final class LoadedTodoState extends TodoState{
  LoadedTodoState({required this.list});

  final List<TodoModels> list;
}