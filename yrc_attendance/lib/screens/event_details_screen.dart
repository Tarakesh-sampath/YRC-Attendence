import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Event Name: ${event.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Date: ${event.date.toString().split(' ')[0]}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Center(
              child: QrImage(
                data: event.id,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('Scan this QR code to mark attendance', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}