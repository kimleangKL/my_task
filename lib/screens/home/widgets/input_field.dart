import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputField({super.key,
  required this.title,
  required this.hint,
  this.controller,
  this.widget,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          
          Text(title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
            width: 1.0,

              ),
              borderRadius: BorderRadius.circular(12)
            ),
           child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
                  autofocus: false,
                  controller: controller,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0
                      ),
                      
                    ),
                    enabledBorder: 
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0
                      ),
                    ),
                  ),
                ),
                ),

                widget==null?Container():Container(child: widget)
            ],
           ),
          )
        ],
      ),




    );
  }
}