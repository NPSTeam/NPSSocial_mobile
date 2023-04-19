import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  int? id;
  String? type;
  String? title;
  String? notes;
  bool? completed;
  DateTime? dueDate;
  int? priority;
  int? order;
  List<int>? tags;
  List<int>? subTasks;

  TaskModel({
    this.id,
    this.type,
    this.title,
    this.notes,
    this.completed,
    this.dueDate,
    this.priority,
    this.order,
    this.tags,
    this.subTasks,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

Map<int, String> taskPriorityMap = {
  0: 'Low',
  1: 'Normal',
  2: 'High',
};
