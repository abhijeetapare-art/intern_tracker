import 'package:flutter/material.dart';
import '../students/principal_students_screen.dart';
import 'widgets/principal_mini_stat_card.dart';
//import 'package:intern_tracker/features/principal/students/principal_students_screen.dart';

class PrincipalDashboardScreen extends StatefulWidget {
  const PrincipalDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalDashboardScreen> createState() =>
      _PrincipalDashboardScreenState();
}

class _PrincipalDashboardScreenState extends State<PrincipalDashboardScreen> {
  int _currentIndex = 0;

  // 🎨 YOUR COLOR PALETTE
  final Color jasmine = const Color(0xFFFFE588);
  final Color tangerine = const Color(0xFFF79D65);
  final Color strawberry = const Color(0xFFF35252);
  final Color aquamarine = const Color(0xFF5EF2D5);
  final Color coolSky = const Color(0xFF60B5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // 🔵 TOP APP BAR (same style as student)
      appBar: AppBar(
        backgroundColor: coolSky,
        elevation: 0,
        title: const Text(
          "INTERN TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),

      // 🔹 BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 10),

            const Text(
              "Welcome back, Principal!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // 📊 STAT CARDS (COMPACT LIKE STUDENT)
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.8, // 👈 makes same compact size
              children: [
                _buildStatCard(
                  icon: Icons.people,
                  number: "320",
                  label: "Total Students",
                  color: coolSky.withOpacity(0.25),
                ),

                _buildStatCard(
                  icon: Icons.work,
                  number: "210",
                  label: "Active Interns",
                  color: jasmine.withOpacity(0.6),
                ),

                _buildStatCard(
                  icon: Icons.pending_actions,
                  number: "12",
                  label: "Pending Approvals",
                  color: strawberry.withOpacity(0.25),
                ),

                _buildStatCard(
                  icon: Icons.account_balance,
                  number: "8",
                  label: "Departments",
                  color: aquamarine.withOpacity(0.35),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 📌 INSTITUTE SUMMARY (LIKE PROGRESS CARD STYLE)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: tangerine.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Institute Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("• 85% Internship Completion Rate"),
                  Text("• 92% Attendance Average"),
                  Text("• 15 New Companies This Year"),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔵 BOTTOM NAVIGATION (MATCHING STUDENT STYLE)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: coolSky,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrincipalStudentScreen(),
              ),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
          BottomNavigationBarItem(
            icon: Icon(Icons.approval),
            label: "Approvals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // 📦 COMPACT STAT CARD (same feel as student screen)
  Widget _buildStatCard({
    required IconData icon,
    required String number,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26),
          const SizedBox(height: 12),
          Text(
            number,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
