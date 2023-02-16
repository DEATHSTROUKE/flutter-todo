import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_list/todo_bloc/view/todo_tile.dart';
import 'package:todo_list/app.dart';
import 'package:todo_list/todo_bloc/models/todo_item.dart';

import '../../constants/colors.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: TodoHomeView(),
    );
  }
}

class TodoHomeView extends StatelessWidget {
  const TodoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      appBar: _buildAppBar(),
      body: TodoBody(),
      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () =>
              context.read<TodoBloc>().add(CreateTodoEvent(text: '')),
          elevation: 0,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Todo List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'DancingScript',
            ),
          ),
        ],
      ),
    );
  }
}

class TodoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Center(
        child: state.todoList.length > 0
            ? ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) =>
                    buildTasks(context, index, state.todoList[index], state.inputFieldIndex))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thumb_up_alt_outlined, size: 50, color: mainColor),
                  Text(
                    'Todo List is empty',
                    style: TextStyle(fontSize: 20, color: mainColor),
                  ),
                ],
              ),
      );
    });
  }

  TodoTile buildTasks(context, index, item, inputFieldIndex) {
    return TodoTile(
      taskName: item.text,
      taskIndex: index,
      taskChecked: item.checked,
      isFieldInput: inputFieldIndex == index,
    );
  }
}
