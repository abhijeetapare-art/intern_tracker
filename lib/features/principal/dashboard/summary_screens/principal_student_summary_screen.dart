import 'package:flutter/material.dart';

class PrincipalStudentSummaryScreen extends StatelessWidget {
  const PrincipalStudentSummaryScreen({super.key});

  // Colors from your specific palette
  final Color coolSky = const Color(0xFF60B5FF);
  final Color aquamarine = const Color(0xFF5EF2D5);
  final Color jasmine = const Color(0xFFFFE588);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Student Enrollment Info",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: coolSky,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Institute Student Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Main Enrollment Stats
            _buildSummaryRow("Total Registered Students", "320", coolSky),
            _buildSummaryRow("Profile Completion Rate", "92%", aquamarine),
            _buildSummaryRow("Verification Pending", "15", jasmine),

            const SizedBox(height: 24),
            const Text(
              "Department-wise Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Simple Department List
            _buildDeptListTile("Computer Science", "120 Students"),
            _buildDeptListTile("Mechanical Engineering", "100 Students"),
            _buildDeptListTile("Civil Engineering", "100 Students"),

            const SizedBox(height: 30),
            Center(
              child: Text(
                "Use the Person icon in the bottom bar for student management.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDeptListTile(String deptName, String count) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(deptName, style: const TextStyle(fontSize: 14)),
        trailing: Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
