import 'package:flutter/material.dart';
import '../../settings/principal_edit_profile_screen.dart';
import '../../settings/principal_notification_settings_screen.dart';
import '../../settings/principal_privacy_security_screen.dart';
import '../../settings/principal_help_support_screen.dart';

// ✅ FIX: Class name must be PrincipalProfileScreen to match Dashboard imports
class PrincipalProfileScreen extends StatelessWidget {
  // ✅ RED LINE FIX: Removed 'const' keyword
  PrincipalProfileScreen({super.key});

  final Color coolSky = const Color(0xFF60B5FF);
  final Color strawberry = const Color(0xFFF35252);

  @override
  Widget build(BuildContext context) {
    // ❌ NO Scaffold or AppBar here: This stops the bulky double-header
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Page title moved into the body for a clean executive look
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              "Account Profile",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // 👤 User Information Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: strawberry,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dr. Arindam Das",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "principal@university.edu",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Principal | University Institute",
                      style: TextStyle(
                        color: coolSky,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ⚙️ Settings Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildProfileOption(
                        context,
                        Icons.person_outline,
                        "Edit Profile",
                        "Update university credentials",
                        PrincipalEditProfileScreen(),
                      ),
                      const Divider(height: 1, indent: 55),
                      _buildProfileOption(
                        context,
                        Icons.notifications_none,
                        "Notifications",
                        "Manage push alerts",
                        PrincipalNotificationSettingsScreen(),
                      ),
                      const Divider(height: 1, indent: 55),
                      _buildProfileOption(
                        context,
                        Icons.lock_outline,
                        "Privacy & Security",
                        "Password and login settings",
                        PrincipalPrivacySecurityScreen(),
                      ),
                      const Divider(height: 1, indent: 55),
                      _buildProfileOption(
                        context,
                        Icons.help_outline,
                        "Help & Support",
                        "FAQs and contact us",
                        PrincipalHelpSupportScreen(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 🚪 Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Add logout logic here
                    },
                    icon: Icon(Icons.logout, color: strawberry, size: 20),
                    label: Text(
                      "Log Out",
                      style: TextStyle(
                        color: strawberry,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: strawberry),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                // Padding for the floating bottom bar
                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context,
    IconData icon,
    String title,
    String sub,
    Widget? destination,
  ) {
    return ListTile(
      leading: Icon(icon, color: coolSky),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(
        sub,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
    );
  }
}
