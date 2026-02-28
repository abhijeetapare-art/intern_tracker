import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/student/auth/Main_Login.dart';
import 'package:flutter_application_2/features/student/profile/EditProfileScreen.dart';
import 'package:flutter_application_2/features/student/profile/NotificationScreen.dart';
import 'package:flutter_application_2/features/student/profile/PrivacySecurityScreen.dart';

class FacultySettingsScreen extends StatefulWidget {
  const FacultySettingsScreen({super.key});

  @override
  State<FacultySettingsScreen> createState() =>
      _FacultySettingsScreenState();
}

class _FacultySettingsScreenState
    extends State<FacultySettingsScreen> {

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      // ❌ NO BACK BUTTON (This is a Tab Screen now)
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF6BB6FF),
        elevation: 0,
        title: const Text(
          "INTERN TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PROFILE CARD
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. John Smith",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "john.smith@university.edu",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Associate Professor",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const EditProfileScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),

            const SizedBox(height: 12),

            /// SETTINGS LIST
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [

                  SettingsTile(
                    icon: Icons.person_outline,
                    title: "Edit Profile",
                    subtitle:
                        "Update your faculty information",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const EditProfileScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  SettingsTile(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    subtitle:
                        "Manage push notifications",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const NotificationScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  SettingsTile(
                    icon: Icons.lock_outline,
                    title: "Privacy & Security",
                    subtitle:
                        "Password and security settings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const PrivacySecurityScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// DARK MODE
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode,
                      color: Colors.blue),
                  const SizedBox(width: 12),
                  const Expanded(child: Text("Dark Mode")),
                  Switch(
                    value: isDarkMode,
                    onChanged: (v) {
                      setState(() => isDarkMode = v);
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// LOG OUT
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout,
                  color: Colors.red),
              label: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side:
                    const BorderSide(color: Colors.red),
                minimumSize:
                    const Size(double.infinity, 48),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),

      // ❌ REMOVE bottomNavigationBar completely
    );
  }
}

////////////////////////////////////////////////////////////
/// SETTINGS TILE
////////////////////////////////////////////////////////////

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}