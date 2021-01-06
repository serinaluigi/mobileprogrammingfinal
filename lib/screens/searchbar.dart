import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ' Search',
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
      ),
    );
  }
}
