import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/start_todos.dart';
import '../models/todo_item.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(InitialTodoState()) {
    on<CreateTodoEvent>(_onCreateTodo);
    on<ChangeCheckTodoEvent>(_onChangeCheckTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<MakeFieldInputEvent>(_onMakeFieldInput);
  }

  late List<todoItem> todo_list;

  void _onCreateTodo(CreateTodoEvent event, Emitter<TodoState> emit) {
    state.todoList.add(todoItem(text: event.text, checked: false));
    emit(state.copyWith(todoList: state.todoList));
  }

  void _onChangeCheckTodo(ChangeCheckTodoEvent event, Emitter<TodoState> emit) {
    state.todoList[event.index].checked = !state.todoList[event.index].checked;
    return emit(state.copyWith(todoList: state.todoList));
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) {
    state.todoList.removeAt(event.index);
    return emit(state.copyWith(todoList: state.todoList));
  }

  void _onMakeFieldInput(MakeFieldInputEvent event, Emitter<TodoState> emit) {
    return emit(state.copyWith(inputFieldIndex: event.index));
  }
}
