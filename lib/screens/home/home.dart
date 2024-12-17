import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/constants/button.dart';
import 'package:task/screens/home/widgets/create_new_task.dart';
import 'package:task/screens/home/widgets/task_list.dart';
import 'package:task/screens/home/widgets/tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(),
      body: Column(
        children: [
          const Gap(20),
          Expanded(
            child: Expanded(child: Tasks()),
          ),
          const Row(
            children: [
              Gap(20),
              Text(
                'Today Tasks',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TaskList(),
                );
              },
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                style: buttonPrimary,
                child: Text('Add New '),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateNewTask()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Gap(20),
              Padding(
                padding: EdgeInsets.all(0.5),
                child: Text(
                  'Hi Kim',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5),
                child: Text(
                  'You have work today',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Column(
              children: [
                Gap(20),
                Container(
                  height: 60,
                  width: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[200],
                    border: Border.all(
                      color: Colors.grey,
                      width: 10,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
