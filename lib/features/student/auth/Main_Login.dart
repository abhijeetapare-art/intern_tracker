import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/faculty/dashboard/screens/faculty_dashboard_screen.dart';
import 'package:flutter_application_2/features/student/navigation/StudentMainScreen.dart';
import 'CreateAccountScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool obscurePassword = true;
  bool startAnimation = false;

  String selectedRole = "Student";
  final List<String> roles = ["Student", "Faculty / Mentor"];

  final Color primaryBlue = const Color(0xFF1976D2);
  final Color cardColor = const Color(0xFFE3F2FD).withOpacity(0.95); // Slight tint
  final Color buttonColor = const Color(0xFF60B5FF).withOpacity(0.85); // Softer button

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => startAnimation = true);
    });
  }

  void handleLogin() {
    if (selectedRole == "Student") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentMainScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FacultyDashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// LOGO ANIMATION
            AnimatedAlign(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              alignment:
                  startAnimation ? Alignment.topCenter : Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 70, color: primaryBlue),
                    const SizedBox(height: 10),
                    Text(
                      "Intern Tracker",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// LOGIN CARD
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: startAnimation ? 1 : 0,
              child: IgnorePointer(
                ignoring: !startAnimation,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 200),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                /// USERNAME
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Username / Email",
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: primaryBlue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                /// PASSWORD
                                TextField(
                                  obscureText: obscurePassword,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: primaryBlue,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: primaryBlue,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = !obscurePassword;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                /// ROLE DROPDOWN
                                DropdownButtonFormField<String>(
                                  value: selectedRole,
                                  decoration: InputDecoration(
                                    labelText: "Select Role",
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: primaryBlue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  items: roles.map((role) {
                                    return DropdownMenuItem(
                                      value: role,
                                      child: Text(role),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRole = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 24),

                                /// LOGIN BUTTON
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: handleLogin,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// SIGN UP
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAccountScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "New user? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}