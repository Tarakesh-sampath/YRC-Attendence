import 'package:flutter/material.dart';

class EventSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Event'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for event selection and invite members
            Text('Event Selection and Member Invites'),
            ElevatedButton(
              onPressed: () {
                // Logic to select event and send email invites
              },
              child: Text('Send Invites'),
            ),
          ],
        ),
      ),
    );
  }
}
