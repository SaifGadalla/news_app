import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => Row(
        children: [
          Text('hi'),
        ],
      ),
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) => Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
  }

}