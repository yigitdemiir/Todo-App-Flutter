// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/all_providers.dart';
import 'package:todo_app/widgets/textfield.dart';
import 'package:todo_app/widgets/title.dart';
import 'package:todo_app/widgets/todo_list_item.dart';
import 'package:todo_app/widgets/toolbar.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel> allTasks = ref.watch(todoNotifier);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const TodoTitle(),
            const SizedBox(height: 10),
            const TodoTextField(),
            const SizedBox(height: 20),
            const TodoToolBar(),
            for (int i = 0; i < allTasks.length; i++)
              ProviderScope(overrides: [
                currentTodoProvider.overrideWithValue(
                  allTasks[i],
                )
              ], child: const TodoItem())
          ],
        ),
      ),
    );
  }
}
