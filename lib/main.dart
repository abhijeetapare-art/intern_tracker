import 'package:flutter/material.dart';
import 'features/faculty/dashboard/screens/faculty_dashboard_screen.dart';

void main() {
  runApp(const InternTrackerApp());
}

class InternTrackerApp extends StatelessWidget {
  const InternTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intern Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        primaryColor: const Color(0xFF60B5FF),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF60B5FF),       // Cool Sky
          secondary: const Color(0xFF5EF2D5),     // Aquamarine
          error: const Color(0xFFF35252),         // Strawberry Red
        ),
        useMaterial3: true,
      ),
      home: const FacultyDashboardScreen(),
    );
  }
}
