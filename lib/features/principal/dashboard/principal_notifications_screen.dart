import 'package:flutter/material.dart';

class PrincipalNotificationsScreen extends StatefulWidget {
  PrincipalNotificationsScreen({super.key});

  @override
  State<PrincipalNotificationsScreen> createState() =>
      _PrincipalNotificationsScreenState();
}

class _PrincipalNotificationsScreenState
    extends State<PrincipalNotificationsScreen> {
  final Color coolSky = const Color(0xFF60B5FF);
  final Color jasmine = const Color(0xFFFFE588);
  final Color strawberry = const Color(0xFFF35252);

  // ✅ LOCAL STATE: Controls the unread status of items on this screen
  bool _allItemsRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: coolSky,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "NOTIFICATIONS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // ✅ UI UPDATE: Marks everything on this screen as read
              setState(() {
                _allItemsRead = true;
              });
            },
            child: const Text(
              "Read all",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            title: "Urgent: Report Pending",
            desc: "CS Department has 15 unverified internship reports.",
            time: "10 mins ago",
            icon: Icons.priority_high,
            iconColor: strawberry,
            isNew: _allItemsRead ? false : true,
          ),
          _buildNotificationItem(
            title: "System Update",
            desc: "The Intern Tracker will undergo maintenance at 12:00 AM.",
            time: "2 hours ago",
            icon: Icons.settings,
            iconColor: coolSky,
            isNew: false,
          ),
          _buildNotificationItem(
            title: "New Placement Record",
            desc: "IT Department reached 90% placement milestone.",
            time: "5 hours ago",
            icon: Icons.emoji_events,
            iconColor: jasmine,
            isNew: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String desc,
    required String time,
    required IconData icon,
    required Color iconColor,
    required bool isNew,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isNew
            ? Border.all(color: iconColor.withOpacity(0.3), width: 1)
            : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (isNew) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: iconColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
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
