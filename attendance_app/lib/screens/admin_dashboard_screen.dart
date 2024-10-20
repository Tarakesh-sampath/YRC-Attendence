import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/event_selection');
              },
              child: Text('Select Event & Invite Members'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qr_scanner');
              },
              child: Text('Scan QR Codes'),
            ),
          ],
        ),
      ),
    );
  }
}
