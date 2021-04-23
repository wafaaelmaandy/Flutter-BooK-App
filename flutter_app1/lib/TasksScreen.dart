import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

class TasksScreen extends StatelessWidget {
  TextStyle detailsTextStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FutureBuilder(
          future: loadTasks(),
          builder: (BuildContext ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.done ||
                snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Oh no! Error! ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              // print( snapshot.data.statusCode);
              return const Text('Nothing to show ');
            }
            List responseBody = json.decode(snapshot.data.body);
            print(responseBody.length);
            print(responseBody.runtimeType);
            int statusCode = snapshot.data.statusCode;
            if (statusCode > 299) {
              return Text('Server error: $statusCode');
            }
            return ListView.builder(
              itemCount: responseBody.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Column(
                          children: [
                            Text(
                              responseBody[index]['taskname'],
                              style: detailsTextStyle,
                            ),
                            Text(
                              responseBody[index]['time'],
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
          },
        ),
      ),
    );
  }
}

Future<http.Response> loadTasks() async {
  // This is an open REST API endpoint for testing purposes
  //https://192.168.1.9/

  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http = new IOClient(ioc);
  const API = "https://10.0.2.2:5001/api/TasksJson";
  // final http.Response response;

  await http.get(Uri.parse(API)).then((response) {
    if (response.statusCode == 200) print("okkkkk");
    final List posts = json.decode(response.body);
    print(posts.length);
    print(posts[0]);
    return posts;
  });

  return await http.get(Uri.parse(API));
}
