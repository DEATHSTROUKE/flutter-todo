import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';

void main() => runApp(const TodoList());

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Verdana'),
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: _buildAppBar(),
        body: TodoBody(),
        floatingActionButton: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
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

class todoItem {
  int id;
  String text;
  bool checked;

  todoItem({required this.id, required this.text, required this.checked});
}

class TodoBody extends StatelessWidget {
  final todo_list = <todoItem>[
    todoItem(id: 1, text: "Make todo", checked: true),
    todoItem(id: 2, text: "Add sql to app", checked: false),
    todoItem(id: 3, text: "Push app to github", checked: false),
    todoItem(
        id: 4,
        text:
            "Ну привет, как дела, скажу я просто, тому парню, что в зеркале в полный рост. Кто ответит тебе на твоои вопросы и надо ли их задавать. Ну и пусть ты свои...",
        checked: false),
  ];

  @override
  Widget build(BuildContext context) {
    // return Center(children: <Widget>[
    //   ListView.builder(itemBuilder: buildTasks)
    // ]);
    return Center(
      child: ListView.builder(
          itemCount: todo_list.length, itemBuilder: buildTasks),
    );
  }

  TodoTile buildTasks(context, index) {
    return TodoTile(
      taskName: todo_list[index].text,
      taskChecked: todo_list[index].checked,
      onChanged: () {},
    );
  }
}

class TodoTile extends StatelessWidget {
  final taskName;
  final taskChecked;
  final onChanged;

  TodoTile({this.taskName, this.taskChecked, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: taskChecked,
            onChanged: (bool? value) {},
          ),
          Expanded(
            child: Text(
              taskName,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
