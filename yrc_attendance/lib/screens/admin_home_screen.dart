import 'package:flutter/material.dart';
import './create_event_screen.dart';
import './event_details_screen.dart';
import '../models/event.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<Event> _events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home')),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Create Event'),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEventScreen()),
              );
              if (result != null && result is Event) {
                setState(() {
                  _events.add(result);
                });
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return ListTile(
                  title: Text(event.name),
                  subtitle: Text(event.date.toString().split(' ')[0]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(event: event),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}