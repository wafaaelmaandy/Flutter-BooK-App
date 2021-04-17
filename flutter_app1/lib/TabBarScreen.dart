import 'package:flutter/material.dart';
import 'package:flutter_app1/AppointmentScreen.dart';
import 'package:flutter_app1/ContactsScreen.dart';
import 'package:flutter_app1/NotesScreen.dart';
import 'package:flutter_app1/NotesScreen.dart';
import 'package:flutter_app1/NotesScreen.dart';
import 'package:flutter_app1/TasksScreen.dart';

class TabBarScreen extends StatelessWidget {
  List<Choice> choices = <Choice>[
    Choice("Appointments", Icons.calendar_today_sharp),
    Choice("Contacts", Icons.contact_page_sharp),
    Choice("Notes", Icons.notes),
    Choice("Tasks", Icons.work)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Book"),

          bottom: TabBar(
            isScrollable: true,
            tabs: choices
                .map((widget) => Tab(
              text: widget.title,
              icon: Icon(widget.iconDate),
            ))
                .toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_outlined),
          onPressed: () {},
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("title"),
                decoration: BoxDecoration(color: Colors.cyan),
              ),
              ListTile(
                title: Text("l1"),
                onTap: () {},
                leading: Icon(Icons.contact_phone),
              ),
              ListTile(
                title: Text("l2"),
                leading: Icon(Icons.contact_phone),
                onTap: () {},
              ),
              ListTile(
                title: Text("l3"),
                leading: Icon(Icons.contact_phone),
                onTap: () {},
              ),
              ListTile(
                title: Text("l4"),
                leading: Icon(Icons.contact_phone),
                onTap: () {},
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AppointmentScreeen(),ContactsScreen(),NotesScreen(),TasksScreen()
          ]
         /* choices.map((Choice choise) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: ChoisePage(choise),
            );
          }).toList(),*/
        ),
      ),
    );
  }
}

class Choice {
  final String title;

  final IconData iconDate;

  const Choice(this.title, this.iconDate);
}

class ChoisePage extends StatelessWidget {
  final Choice choice;

  const ChoisePage(this.choice);

  @override
  Widget build(BuildContext context) {
    return Text("d");
  }
}
