// In lib/models/event.dart
import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final DateTime date;

  Event({
    @required this.id,
    @required this.name,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
    );
  }
}

