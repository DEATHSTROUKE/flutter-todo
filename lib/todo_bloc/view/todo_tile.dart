import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/todo_bloc/bloc/todo_bloc.dart';

class TodoTile extends StatelessWidget {
  final taskName;
  final taskIndex;
  final taskChecked;
  final isFieldInput;

  TodoTile(
      {this.taskName, this.taskIndex, this.taskChecked, this.isFieldInput});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        bloc.add(DeleteTodoEvent(index: taskIndex));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10),
        padding: EdgeInsets.only(left: 2, right: 2, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: taskBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: taskChecked,
              onChanged: (bool? a) {
                bloc.add(ChangeCheckTodoEvent(index: taskIndex));
              },
            ),
            Expanded(
              child: isFieldInput
                  ? TextFormField(
                      initialValue: taskName,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      autofocus: true,
                    )
                  : GestureDetector(
                      onTap: () =>
                          bloc.add(MakeFieldInputEvent(index: taskIndex)),
                      child: Text(taskName),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
