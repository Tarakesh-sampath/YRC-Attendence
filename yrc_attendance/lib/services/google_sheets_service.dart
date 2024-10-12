import 'dart:convert';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GoogleSheetsService {
  static const _credentials = r'''
    // Paste your Service Account Key JSON here
  ''';

  static const _spreadsheetId = 'YOUR_SPREADSHEET_ID';
  static const _studentSheetName = 'Students';
  static const _attendanceSheetName = 'Attendance';

  SheetsApi _sheetsApi;

  Future<void> init() async {
    final credentialsJson = json.decode(_credentials);
    final accountCredentials = ServiceAccountCredentials.fromJson(credentialsJson);
    final scopes = [SheetsApi.spreadsheetsScope];
    final client = await clientViaServiceAccount(accountCredentials, scopes);
    _sheetsApi = SheetsApi(client);
  }

  Future<List<List<String>>> getStudents() async {
    final response = await _sheetsApi.spreadsheets.values.get(_spreadsheetId, '$_studentSheetName!A2:D');
    return response.values.map((row) => row.map((cell) => cell.toString()).toList()).toList();
  }

  Future<void> addStudent(String id, String name, String department, String year) async {
    await _sheetsApi.spreadsheets.values.append(
      ValueRange(values: [[id, name, department, year]]),
      _spreadsheetId,
      '$_studentSheetName!A2:D',
      valueInputOption: 'USER_ENTERED',
    );
  }

  Future<void> markAttendance(String studentId, String eventId, bool present) async {
    await _sheetsApi.spreadsheets.values.append(
      ValueRange(values: [[studentId, eventId, present ? '1' : '0']]),
      _spreadsheetId,
      '$_attendanceSheetName!A2:C',
      valueInputOption: 'USER_ENTERED',
    );
  }

  Future<List<List<String>>> getAttendance(String studentId) async {
    final response = await _sheetsApi.spreadsheets.values.get(_spreadsheetId, '$_attendanceSheetName!A2:C');
    return response.values
        .where((row) => row[0] == studentId)
        .map((row) => row.map((cell) => cell.toString()).toList())
        .toList();
  }
}