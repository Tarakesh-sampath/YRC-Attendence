import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/admin_dashboard_screen.dart';
import 'screens/event_selection_screen.dart';
import 'screens/qr_scanner_screen.dart';

void main() {
  runApp(AttendanceMarkingApp());
}

class AttendanceMarkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Marking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/admin_dashboard': (context) => AdminDashboardScreen(),
        '/event_selection': (context) => EventSelectionScreen(),
        '/qr_scanner': (context) => QRScannerScreen(),
      },
    );
  }
}
