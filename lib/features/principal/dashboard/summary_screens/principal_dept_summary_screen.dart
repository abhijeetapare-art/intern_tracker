import 'package:flutter/material.dart';

class PrincipalDeptSummaryScreen extends StatelessWidget {
  const PrincipalDeptSummaryScreen({super.key});

  // Colors from your specific palette
  final Color aquamarine = const Color(0xFF5EF2D5);
  final Color coolSky = const Color(0xFF60B5FF);
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
          "Departmental Overview",
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
              "Institute Branch Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Branch Status Metrics
            _buildDeptStatusTile(
              "Computer Science",
              "Active HOD",
              "85% Placement",
              aquamarine,
            ),
            _buildDeptStatusTile(
              "Mechanical Eng.",
              "Active HOD",
              "65% Placement",
              coolSky,
            ),
            _buildDeptStatusTile(
              "Civil Engineering",
              "Pending HOD",
              "40% Placement",
              jasmine,
            ),

            const SizedBox(height: 24),
            const Text(
              "Administrative Coverage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Summary Statistics
            const Card(
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text("8 Total Departments"),
                subtitle: Text("7 HODs Approved & Active"),
              ),
            ),

            const SizedBox(height: 30),
            Center(
              child: Text(
                "Use the Department icon in the bottom bar for full management.",
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

  Widget _buildDeptStatusTile(
    String name,
    String hodStatus,
    String placement,
    Color accentColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("HOD: $hodStatus", style: const TextStyle(fontSize: 13)),
              Text(
                placement,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
