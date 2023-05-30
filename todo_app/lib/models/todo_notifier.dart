import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  void removeTodo(String id) {
    state = [
      for (var todo in state)
        if (todo.id != id) todo
    ];
  }

  void toogle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: id,
              description: todo.description,
              isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  void edit({required String newDescription, required String id}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: newDescription,
              isCompleted: todo.isCompleted)
        else
          todo
    ];
  }
}
