import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  TextStyle detailsTextStyle = TextStyle(fontSize: 20) ;
  TextStyle titleTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ;


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
                CircleAvatar(child: Image.network('https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true')
                  ,),
                Column(
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
              ],
            ),

          ),
        );
      },
    );
  }
}
