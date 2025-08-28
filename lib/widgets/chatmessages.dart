import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key , required this.isSentByMe, required this.text});
  
  final bool isSentByMe ;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
        right: isSentByMe ? 50.0 : 10 ,
        left: isSentByMe ? 10 : 50.0,
        top: 8.0,
        bottom: 8.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}