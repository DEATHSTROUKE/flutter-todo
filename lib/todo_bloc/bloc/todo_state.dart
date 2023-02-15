part of 'todo_bloc.dart';

class TodoState {
  TodoState({required this.todoList});

  final List<todoItem> todoList;

  TodoState copyWith({List<todoItem>? todoList}) {
    var list = todoList ?? this.todoList;
    return TodoState(todoList: list);
  }
}

final this_list = <todoItem>[
  todoItem(text: "Make todo", checked: true),
  todoItem(text: "Add sql to app", checked: false),
  todoItem(text: "Add sql to app", checked: true),
  todoItem(text: "Push app to github", checked: false),
  todoItem(
      text:
          "Ну привет, как дела, скажу я просто, тому парню, что в зеркале в полный рост. Кто ответит тебе на твоои вопросы и надо ли их задавать. Ну и пусть ты свои...",
      checked: false),
];

class InitialTodoState extends TodoState {
  InitialTodoState({List<todoItem>? list}) : super(todoList: list ?? this_list);
}
