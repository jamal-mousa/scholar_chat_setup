import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key , required this.hintText , this.onChanged});
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField
          (
            validator: (data)
            {
              if(data == null || data.isEmpty)
              {
                return 'This field is required';
              }
              return null;
            },
            onChanged: onChanged ,
            decoration: InputDecoration
            (
              hintText: hintText,
              hintStyle: TextStyle
              (
                color: Colors.white
              ),
              border: OutlineInputBorder
              (
                borderSide: BorderSide
                (
                  color: Colors.red
                )
              ),
              enabledBorder: OutlineInputBorder
              (
                borderSide: BorderSide
                (
                  color: Colors.white
                )
              ),
              focusedBorder: OutlineInputBorder
              (
                borderSide: BorderSide
                (
                  color: Colors.green
                )
              ),
              
            ),
          );
  }
}