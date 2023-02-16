part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  TodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final String text;

  CreateTodoEvent({required this.text});
}

class ChangeCheckTodoEvent extends TodoEvent {
  final int index;

  ChangeCheckTodoEvent({required this.index});
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  DeleteTodoEvent({required this.index});
}

class MakeFieldInputEvent extends TodoEvent {
  final int index;

  MakeFieldInputEvent({required this.index});
}
