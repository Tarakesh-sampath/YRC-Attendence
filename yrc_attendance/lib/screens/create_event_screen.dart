import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/event.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  String _eventName;
  DateTime _eventDate = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final newEvent = Event(
        id: Uuid().v4(),
        name: _eventName,
        date: _eventDate,
      );
      // TODO: Save the event (we'll implement this later)
      Navigator.pop(context, newEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Event')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an event name';
                  }
                  return null;
                },
                onSaved: (value) {
  _eventName = value;
},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Select Date'),
                onPressed: () async {
                  final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: _eventDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (picked != null) {
                    setState(() {
                      _eventDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Text('Selected Date: ${_eventDate.toString().split(' ')[0]}'),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Create Event'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}