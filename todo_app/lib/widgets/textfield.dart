import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/all_providers.dart';
import 'package:uuid/uuid.dart';

class TodoTextField extends ConsumerWidget {
  const TodoTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController todoController = TextEditingController();

    return TextField(
      controller: todoController,
      decoration: const InputDecoration(
        label: Text("Bugün neler yapacaksın?"),
      ),
      onSubmitted: (newTodo) {
        ref.watch(todoNotifier.notifier).addTodo(
              TodoModel(id: const Uuid().v4(), description: newTodo),
            );
      },
    );
  }
}
