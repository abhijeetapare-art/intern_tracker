import 'package:flutter/material.dart';

class PrincipalPerformanceScreen extends StatelessWidget {
  // ✅ RED LINE FIX: Removed 'const' keyword so it works in the Dashboard list
  PrincipalPerformanceScreen({super.key});

  final Color coolSky = const Color(0xFF60B5FF);
  final Color jasmine = const Color(0xFFFFE588);
  final Color tangerine = const Color(0xFFF79D65);
  final Color strawberry = const Color(0xFFF35252);
  final Color aquamarine = const Color(0xFF5EF2D5);

  @override
  Widget build(BuildContext context) {
    // ❌ NO Scaffold or AppBar here: This removes the bulky double-header
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 10),
        // ✅ Page title is now a clean heading inside the body
        const Text(
          "Institute Analytics",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // 📈 SECTION 1: PROGRESSIVE VELOCITY BARS
        _buildProgressiveTrendCard(),

        const SizedBox(height: 30),

        // 🍕 SECTION 2: INDUSTRY DISTRIBUTION
        const Text(
          "Recruitment by Sector",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildIndustrySection(),

        const SizedBox(height: 30),

        // 🕒 SECTION 3: ADMINISTRATIVE OVERSIGHT
        const Text(
          "Administrative Activity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildActivityLog(
          "CS Department",
          "HOD Verified 12 reports",
          "2 hours ago",
        ),
        _buildActivityLog(
          "ME Department",
          "Monthly sync completed",
          "5 mins ago",
        ),

        // Ensures content isn't hidden by the floating bottom bar
        const SizedBox(height: 120),
      ],
    );
  }

  Widget _buildProgressiveTrendCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Progress Velocity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Tracking completion rate across months",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 30),

          // 📈 Progressive Bars
          _buildProgressiveBar("January", 0.45, jasmine),
          _buildProgressiveBar("February", 0.70, coolSky),
          _buildProgressiveBar("March", 0.55, tangerine),
          _buildProgressiveBar("April", 0.90, aquamarine),
          _buildProgressiveBar("May", 0.82, coolSky),
        ],
      ),
    );
  }

  Widget _buildProgressiveBar(String month, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                "${(progress * 100).toInt()}% Done",
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 12,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.7), color],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndustrySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          _industryRow("Software & IT Services", "65%", aquamarine),
          const Divider(height: 24),
          _industryRow("Manufacturing & Core", "20%", tangerine),
          const Divider(height: 24),
          _industryRow("Infrastructure / Civil", "15%", strawberry),
        ],
      ),
    );
  }

  Widget _industryRow(String label, String value, Color color) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildActivityLog(String dept, String action, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.history_rounded, size: 20, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dept, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  action,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.black54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
