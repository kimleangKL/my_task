import 'package:flutter/material.dart';
import 'package:task/screens/home/widgets/edite_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 65,
      
      color: Colors.grey[200],
      child: Row(
        
        children: [
          const Expanded(child: Icon(Icons.lens_outlined)),
          const Expanded(
              child: Column(
            children: [
              SizedBox(height: 15),
              Text('Email to Ameer'),
              Text(
                '08:00AM to 12:00 PM',
                style: TextStyle(fontSize: 8),
              ),
            ],
          )),
          Expanded(child:IconButton(icon:const Icon (Icons.edit_location_sharp),
          onPressed:() {
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditeTask()));
          },
          
          
          ),
          
          ),
          const Expanded(child: Icon(Icons.delete_sweep_rounded)),
        ],
      ),
    );
  }
}
