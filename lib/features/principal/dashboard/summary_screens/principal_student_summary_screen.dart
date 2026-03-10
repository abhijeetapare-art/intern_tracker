import 'package:flutter/material.dart';
import 'dart:math';
import 'principal_year_selection_screen.dart'; // For navigation to year selection
import 'principal_full_master_list.dart'; // Added for navigation to the full list

class PrincipalStudentSummaryScreen extends StatefulWidget {
  const PrincipalStudentSummaryScreen({super.key});

  @override
  State<PrincipalStudentSummaryScreen> createState() =>
      _PrincipalStudentSummaryScreenState();
}

class _PrincipalStudentSummaryScreenState
    extends State<PrincipalStudentSummaryScreen> {
  int? touchedIndex; // Tracks which slice is popped out

  final Color coolSky = const Color(0xFF60B5FF);
  final Color aquamarine = const Color(0xFF5EF2D5);
  final Color jasmine = const Color(0xFFFFE588);
  final Color strawberry = const Color(0xFFF35252);

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

            // ✅ BLUEPRINT RESTORED: Total Registered Students Tab (Navigation Added)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrincipalFullMasterList(),
                  ),
                );
              },
              child: _buildSummaryRow(
                "Total Registered Students",
                "320",
                coolSky,
              ),
            ),

            const SizedBox(height: 30),

            // ✅ THE ANIMATED PIE CHART (Large & Interactive)
            const Text(
              "Internship Phase Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                clipBehavior:
                    Clip.none, // Allows info box to sit outside the box
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTapDown: (details) => _handleTap(details.localPosition),
                    child: CustomPaint(
                      size: const Size(220, 220),
                      painter: BlueprintPiePainter(touchedIndex: touchedIndex),
                    ),
                  ),
                  // NEW: Floating Tooltip that sits near the active slice
                  if (touchedIndex != null) _buildFloatingTooltip(),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildLegend(),

            const SizedBox(height: 32),

            // ✅ BLUEPRINT RESTORED: The 9-Department List (IT First)
            const Text(
              "Department-wise Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildDeptListTile("Information Technology", "85 Students"),
            _buildDeptListTile("Computer Engineering", "75 Students"),
            _buildDeptListTile("Mechanical Engineering", "40 Students"),
            _buildDeptListTile("Civil Engineering", "30 Students"),
            _buildDeptListTile("Electrical Engineering", "25 Students"),
            _buildDeptListTile("Electronics & TC", "35 Students"),
            _buildDeptListTile("Automobile Engineering", "10 Students"),
            _buildDeptListTile("Instrumentation", "12 Students"),
            _buildDeptListTile("Chemical Engineering", "8 Students"),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // 1. Updated _handleTap with Reset Logic
  void _handleTap(Offset pos) {
    setState(() {
      double dx = pos.dx - 110;
      double dy = pos.dy - 110;
      double distance = sqrt(dx * dx + dy * dy);

      // If click is too far (outside chart) or too close to center (reset)
      if (distance > 110 || distance < 20) {
        touchedIndex = null;
        return;
      }

      double angle = atan2(dy, dx) * 180 / pi;
      angle = (angle + 90) % 360;
      if (angle < 0) angle += 360;

      if (angle >= 0 && angle < 120) {
        touchedIndex = 0;
      } else if (angle >= 120 && angle < 240) {
        touchedIndex = 1;
      } else {
        touchedIndex = 2;
      }
    });
  }

  // 3. New Floating Tooltip Widget
  Widget _buildFloatingTooltip() {
    List<String> labels = ["Placed", "Applied", "Not Started"];
    List<String> counts = ["128", "92", "100"];

    // Logic to position the box based on which slice is active
    double top = touchedIndex == 0 ? -40 : (touchedIndex == 1 ? 120 : 120);
    double left = touchedIndex == 0 ? 60 : (touchedIndex == 1 ? 140 : -40);

    return Positioned(
      top: top,
      left: left,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${labels[touchedIndex!]}: ${counts[touchedIndex!]}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Restoring the clean Blueprint UI Widgets...
  Widget _buildSummaryRow(String title, String value, Color color) {
    return Container(
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

  Widget _buildDeptListTile(String name, String count) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        onTap: () {
          // NEXT STEP: Navigate to Year Selection Screen for this department
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PrincipalYearSelectionScreen(departmentName: name),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendCircle(aquamarine, "Placed"),
        const SizedBox(width: 15),
        _legendCircle(jasmine, "Applied"),
        const SizedBox(width: 15),
        _legendCircle(strawberry.withOpacity(0.6), "Not Started"),
      ],
    );
  }

  Widget _legendCircle(Color col, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: col, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class BlueprintPiePainter extends CustomPainter {
  final int? touchedIndex;
  BlueprintPiePainter({this.touchedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    List<Color> colors = [
      const Color(0xFF5EF2D5),
      const Color(0xFFFFE588),
      const Color(0xFFF35252).withOpacity(0.6),
    ];
    double startAngle = -pi / 2;

    for (int i = 0; i < 3; i++) {
      final sweepAngle = (2 * pi) / 3;
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      if (touchedIndex == i) {
        canvas.save();
        // POP OUT ANIMATION
        double offset = 12.0;
        double midAngle = startAngle + sweepAngle / 2;
        canvas.translate(cos(midAngle) * offset, sin(midAngle) * offset);
        canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
        // Drawing a white border to make it pop more
        canvas.drawArc(
          rect,
          startAngle,
          sweepAngle,
          true,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
        canvas.restore();
      } else {
        canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      }
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
