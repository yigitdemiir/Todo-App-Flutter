import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants/toolbar_style.dart';
import 'package:todo_app/providers/all_providers.dart';

class TodoToolBar extends ConsumerWidget {
  const TodoToolBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "${ref.watch(unCompletedTasksProvider)} task uncompleted",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Tooltip(
          message: "Shows All Tasks",
          child: TextButton(
            style: Constants.toolbarStyle(),
            onPressed: () {},
            child: const Text(
              "All",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Tooltip(
          message: "Shows Active Tasks",
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Active",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Tooltip(
          message: "Shows Completed Tasks",
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Completed",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
