import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({super.key , required this.nameOfButtom , this.onTap});
  final String nameOfButtom;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container
            (
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.circular(16),
                color: Colors.white
              ),
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text
                (
                  nameOfButtom
                ),
              ),
            ),
    );
  }
}