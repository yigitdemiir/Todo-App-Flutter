// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/all_providers.dart';

class TodoItem extends ConsumerStatefulWidget {
  const TodoItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoItemState();
}

class _TodoItemState extends ConsumerState<TodoItem> {
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentTodo = ref.watch(currentTodoProvider);

    return Dismissible(
      key: ValueKey(currentTodo.id),
      onDismissed: (direction) {
        ref.watch(todoNotifier.notifier).removeTodo(currentTodo.id);
      },
      child: Focus(
        onFocusChange: (isFocused) {
          if (!isFocused) {
            setState(
              () {
                hasFocus = false;
              },
            );
            ref.read(todoNotifier.notifier).edit(
                newDescription: textEditingController.text, id: currentTodo.id);
          }
        },
        child: ListTile(
          onTap: () {
            setState(() {
              hasFocus = true;
              focusNode.requestFocus();
              textEditingController.text = currentTodo.description;
            });
          },
          leading: Checkbox(
            value: currentTodo.isCompleted,
            onChanged: (value) =>
                ref.watch(todoNotifier.notifier).toogle(currentTodo.id),
          ),
          title: hasFocus
              ? TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                )
              : Text(currentTodo.description),
        ),
      ),
    );
  }
}
