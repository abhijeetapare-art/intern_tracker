import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/faculty/dashboard/bottom_nav_bar.dart';
import 'package:flutter_application_2/features/faculty/dashboard/widgets/Faculty_action_card.dart';
import 'package:flutter_application_2/features/faculty/dashboard/widgets/faculty_stats_card.dart';
import 'package:flutter_application_2/features/faculty/calendar/faculty_calendar_screen.dart';
import 'package:flutter_application_2/features/faculty/groups/groups_screen.dart';
import 'package:flutter_application_2/features/faculty/profile/screens/faculty_profile_screen.dart';

class FacultyDashboardScreen extends StatefulWidget {
  const FacultyDashboardScreen({super.key});

  @override
  State<FacultyDashboardScreen> createState() =>
      _FacultyDashboardScreenState();
}

class _FacultyDashboardScreenState
    extends State<FacultyDashboardScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 1:
        return const GroupsScreen();
      case 2:
        return const FacultyCalendarScreen();
      case 3:
        return const FacultySettingsScreen();
      default:
        return _buildDashboardContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: FacultyBottomNav(
        currentIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }

  // ================= DASHBOARD UI =================

  Widget _buildDashboardContent() {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF6BB6FF),
        elevation: 0,
        title: const Text(
          "INTERN TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome back, Faculty!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: MiniStatCard(
                    icon: Icons.group,
                    value: "42",
                    label: "Students",
                    bg: Color(0xFFD9ECFF),
                    iconColor: Colors.blue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MiniStatCard(
                    icon: Icons.work,
                    value: "5",
                    label: "Internships",
                    bg: Color(0xFFFFF2CC),
                    iconColor: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: MiniStatCard(
                    icon: Icons.assignment,
                    value: "18",
                    label: "Reports",
                    bg: Color(0xFFFFE6D9),
                    iconColor: Colors.deepOrange,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MiniStatCard(
                    icon: Icons.pending_actions,
                    value: "6",
                    label: "Pending",
                    bg: Color(0xFFDFF5EA),
                    iconColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              "Recent Activity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FacultyActionCard(
              icon: Icons.person,
              title: "View Mentors",
              subtitle: "Manage assigned mentors",
            ),
            SizedBox(height: 12),
            FacultyActionCard(
              icon: Icons.work_outline,
              title: "Internship Details",
              subtitle: "View and update internships",
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}