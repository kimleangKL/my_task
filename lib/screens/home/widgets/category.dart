import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 10),
       child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 52,
                width: 110,
                
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.green,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Education"),
              ),
              SizedBox(width: 20),
              Container(
                alignment: Alignment.center,
                height: 52,
                width: 110,
                
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.green,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Work"),
              ),
              SizedBox(width: 20),
              Container(
                alignment: Alignment.center,
                height: 52,
                width: 110,
                
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(
                      color: Colors.green,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Groceries"),
              ),
            ],
          )

        ],
       ),




    );
  }
}