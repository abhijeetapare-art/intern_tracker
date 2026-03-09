import 'package:flutter/material.dart';

class PrincipalActiveInternSummaryScreen extends StatelessWidget {
  const PrincipalActiveInternSummaryScreen({super.key});

  // Colors from your palette
  final Color jasmine = const Color(0xFFFFE588);
  final Color coolSky = const Color(0xFF60B5FF);
  final Color aquamarine = const Color(0xFF5EF2D5);

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
          "Active Intern Summary",
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
              "Current Internship Briefing",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Basic Info Cards
            _buildInfoTile("Total Students Placed", "210", coolSky),
            // ✅ REMOVED: Ongoing Internships row
            _buildInfoTile("Completed This Month", "25", aquamarine),

            const SizedBox(height: 24),
            const Text(
              "Top Partner Companies",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Simple List of Partners
            _buildCompanyItem("Google", "45 Interns"),
            _buildCompanyItem("Microsoft", "32 Interns"),
            _buildCompanyItem("Tesla", "18 Interns"),

            // ✅ REMOVED: Bottom instruction text and its Center widget
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyItem(String name, String count) {
    return ListTile(
      leading: const Icon(Icons.business, color: Colors.grey),
      title: Text(name),
      trailing: Text(
        count,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
