import 'package:bloc/bloc.dart';
import 'package:exam1/data/models/todo_models.dart';
import 'package:exam1/data/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();
  TodoBloc() : super(TodoInitial()) {
    on<GetTodoListEvent>((event, emit) async{
      try{
        emit(LoadingTodoState());
        final List<TodoModels> todoList = await _repository.getTodoList();
        emit(LoadedTodoState(list: todoList));
      } catch(e){
        print('Ошибка репозитория $e');
        emit(ErrosTodoState());
      }
    });
  }
}
