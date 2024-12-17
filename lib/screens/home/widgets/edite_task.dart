import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/screens/home/home.dart';
import 'package:task/screens/home/widgets/category.dart';
import 'package:task/screens/home/widgets/column.dart';
import 'package:task/screens/home/widgets/input_field.dart';

class EditeTask extends StatefulWidget {
  const EditeTask({super.key});

  @override
  State< EditeTask> createState() => _EditeTaskState();
}

class _EditeTaskState extends State<EditeTask> {
  DateTime _selectedDate = DateTime.now();
  String _endtime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(title: 'Task Name', hint: 'Call Ameer'),

              SizedBox(height: 30),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Category',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Category(),
                ],
              ),
              SizedBox(height: 20),
              InputField(
                title: 'Date & Time',
                hint: DateFormat.yMMMMEEEEd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined, color: Colors.grey),
                  onPressed: () {
                    _getDateFormUser();
                  },
                ),
              ),
              
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _starttime,
                      widget: IconButton(
                        icon:
                            Icon(Icons.access_time_rounded, color: Colors.grey),
                        onPressed: () {
                          _gettimeFromUser(isStartTime: true);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endtime, //check
                      widget: IconButton(
                        icon:
                            Icon(Icons.access_time_rounded, color: Colors.grey),
                        onPressed: () {
                          _gettimeFromUser(isStartTime: false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
               const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Priority',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  ColunmInput(),
                ],
              ),
              InputField(
                  title: 'Description', hint: 'Meeting 9:00 am to 5:00 pm '),
            SizedBox(height: 30),
            Container(
                alignment: Alignment.center,
                height: 52,
                width: 300,
                
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.green,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Save change"),
              ),
                  
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Edit your task",
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: ElevatedButton(
        child: const Icon(Icons.arrow_back, size: 20),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }

  _getDateFormUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2125));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('something wrong?');
    }
  }

  _gettimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
    } else if (isStartTime == true) {
      setState(() {
        _starttime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endtime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_starttime.split(":")[0]),
            minute: int.parse(_starttime.split(":")[1].split(" ")[0])));
  }
}
