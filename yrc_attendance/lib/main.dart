import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sheetsService = GoogleSheetsService();
  await sheetsService.init();
  runApp(YRCAttendanceApp(sheetsService: sheetsService));
}

class YRCAttendanceApp extends StatelessWidget {
  final GoogleSheetsService sheetsService;

  YRCAttendanceApp({@required this.sheetsService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YRC Attendance',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginScreen(sheetsService: sheetsService),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YRC Attendance Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Login as Admin'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login as Student'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentHomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, Admin!'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create Event'),
              onPressed: () {
                // TODO: Implement event creation
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Mark Attendance'),
              onPressed: () {
                // TODO: Implement attendance marking
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StudentHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, Student!'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Scan QR Code'),
              onPressed: () {
                // TODO: Implement QR code scanning
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('View Attendance'),
              onPressed: () {
                // TODO: Implement attendance viewing
              },
            ),
          ],
        ),
      ),
    );
  }
}