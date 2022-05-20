import 'package:flutter/material.dart';
import 'package:pozo/color.dart';
import 'package:pozo/widget/task.dart';
import 'package:collection/collection.dart';

List filterTask(actualtask, condition) {
  //function to filter task according to status
  List processedTask = actualtask
      .map((task) => task.values.contains(condition) ? task.keys : null)
      .toList();
  processedTask = processedTask.whereNotNull().toList();
  return processedTask;
}

class TaskDetails extends StatelessWidget {
  final Map employeeDetails;
  const TaskDetails({Key? key, required this.employeeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pendingTask = filterTask(employeeDetails['task'], "pending");
    List completedTask = filterTask(employeeDetails['task'], "completed");
    List overdueTask = filterTask(employeeDetails['task'], "overdue");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.pending),
                text: "Pending",
              ),
              Tab(
                icon: Icon(Icons.done_all_rounded),
                text: "Completed",
              ),
              Tab(
                icon: Icon(
                  Icons.cancel_schedule_send_rounded,
                ),
                text: "overdue",
              ),
            ],
          ),
          title: Text(employeeDetails['name'] + " tasks"),
        ),
        body: TabBarView(
          children: [
            taskCard("pending", pendingTask),
            taskCard("completed", completedTask),
            taskCard("overdue", overdueTask),
          ],
        ),
      ),
    );
  }
}
