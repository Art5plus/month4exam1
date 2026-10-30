import 'package:dio/dio.dart';
import 'package:exam1/data/models/todo_models.dart';


class TodoRepository {
  final Dio _dio = Dio();

  Future<List<TodoModels>> getTodoList()async{
    final Response response= await _dio.get('https://dummyjson.com/todos');
    List<dynamic> list = response.data['todos'];
    List<TodoModels> todoList = [];
    list.forEach((todo){
      todoList.add(TodoModels.fromJson(todo));
    });
    return todoList;
  }
}