import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  TextStyle titleTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ;
  TextStyle detailsTextStyle = TextStyle(fontSize: 20) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  position.toString(),
                  style: titleTextStyle,
                ),
                Text(
                  position.toString(),
                  style: detailsTextStyle,
                ),
              ],
            ),

          ),
        );
      },
    );
  }
}
