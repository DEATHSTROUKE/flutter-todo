part of 'todo_bloc.dart';

class TodoState {
  TodoState({required this.todoList, required this.inputFieldIndex});

  final List<todoItem> todoList;
  int inputFieldIndex = -1;

  TodoState copyWith({List<todoItem>? todoList, int? inputFieldIndex}) {
    var list = todoList ?? this.todoList;
    var index = inputFieldIndex ?? this.inputFieldIndex;
    return TodoState(todoList: list, inputFieldIndex: index);
  }
}

class InitialTodoState extends TodoState {
  InitialTodoState({List<todoItem>? list})
      : super(todoList: list ?? START_TODOS, inputFieldIndex: -1);
}
