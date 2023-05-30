import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/models/todo_notifier.dart';

final todoNotifier = StateNotifierProvider<TodoNotifier, List<TodoModel>>(
    (ref) => TodoNotifier());

final unCompletedTasksProvider = Provider<int>((ref) {
  return ref
      .watch(todoNotifier)
      .where((element) => !element.isCompleted)
      .length;
});

final currentTodoProvider = Provider<TodoModel>((ref) {
  throw UnimplementedError();
});
