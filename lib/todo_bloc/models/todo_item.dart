import 'package:equatable/equatable.dart';

class todoItem extends Equatable {
  String text;
  bool checked;

  todoItem({required this.text, required this.checked});

  @override
  List<Object?> get props => [text, checked];

  @override
  int get hashCode => super.hashCode;
}
