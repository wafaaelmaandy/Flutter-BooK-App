import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
class NotesScreen extends StatelessWidget {
  TextStyle titleTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ;
  TextStyle detailsTextStyle = TextStyle(fontSize: 20) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
        child: FutureBuilder(
        future: loadNotes(),
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
            child: Column(
              children: [
                Text(
                  responseBody[index]['title'],
                  style: titleTextStyle,
                ),
                Text(
                  responseBody[index]['body'],
                  style: detailsTextStyle,
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

Future<http.Response> loadNotes() async {
  // This is an open REST API endpoint for testing purposes
  //https://192.168.1.9/

  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http = new IOClient(ioc);
  const API = "https://10.0.2.2:5001/api/NotesJson";
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