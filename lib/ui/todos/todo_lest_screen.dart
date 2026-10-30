import 'package:exam1/ui/todos/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoLestScreen extends StatefulWidget {
  const TodoLestScreen({super.key});

  @override
  State<TodoLestScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoLestScreen> {
  final TodoBloc _todoBloc = TodoBloc();

  @override
  void initState() {
    _todoBloc.add(GetTodoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List', style: TextStyle(fontSize: 35)),
        centerTitle: true,
        backgroundColor: Colors.white54,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: _todoBloc,
        builder: (context, state) {
          if (state is LoadedTodoState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Card(margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.list[index].todo,
                                style: TextStyle(fontSize: 30),
                              ),
                              const SizedBox(height: 15),
                              Text('UserID: № ${state.list[index].iserId}',
                                style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: state.list[index].completed,
                            shape: const CircleBorder(),
                            onChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is ErrosTodoState) {
            return Text(
              'Flutter 08 Error',
              style: TextStyle(fontSize: 50, color: Colors.red),
            );
          }
          return CircularProgressIndicator.adaptive();
        },
      ),
    );
  }

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }
}
