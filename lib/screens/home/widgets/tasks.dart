import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task/models/task.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => tasksList[index].isLast
            ? _BuildAddTask()
            : _buildTask(context, tasksList[index]),
      ),
    );
  }

  Widget _BuildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: [10,10],
      color: Colors.grey,
      strokeWidth: 2,

      child: const Center(
        child: Text('+Add',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      
    );
  }

  Widget _buildTask(BuildContext context, Task task) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: task.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            task.iconData,
            color: task.iconColor,
            size: 20,
          ),
          const SizedBox(height: 10),
          Text(
            task.title!,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildTaskStatus(
                  task.btnColor!, task.iconColor!, '${task.left} left'),
              SizedBox(width: 5),
              _buildTaskStatus(
                  Colors.white, task.iconColor!, '${task.done} done'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color txColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: txColor),
      ),
    );
  }
}
