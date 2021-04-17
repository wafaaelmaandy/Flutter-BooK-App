import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  TextStyle detailsTextStyle = TextStyle(fontSize: 20) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Checkbox(value: false, onChanged: null),
                Column(
                  children: [
                    Text(
                      position.toString(),
                      style: detailsTextStyle,
                    ),
                    Text(
                      position.toString(),
                      style: detailsTextStyle,
                    ),
                  ],
                ),
              ],
            ),

          ),
        );
      },
    );
  }
}
