import 'package:flutter/material.dart';
import '../patient/patientdashboard.dart';

class CaregiverAppSettingsPage extends StatefulWidget {
  const CaregiverAppSettingsPage({super.key});

  @override
  State<CaregiverAppSettingsPage> createState() =>
      _CaregiverAppSettingsPageState();
}

class _CaregiverAppSettingsPageState extends State<CaregiverAppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 24),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'App Settings',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Settings Options
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Notification
                    _buildSettingsOption(
                      icon: Icons.notifications_outlined,
                      title: 'Notification',
                      onTap: () {
                        // Navigate to notification settings
                      },
                    ),
                    const SizedBox(height: 16),

                    // Sound & Haptics
                    _buildSettingsOption(
                      icon: Icons.volume_up_outlined,
                      title: 'Sound & Haptics',
                      onTap: () {
                        // Navigate to sound & haptics settings
                      },
                    ),
                    const SizedBox(height: 16),

                    // Privacy
                    _buildSettingsOption(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy',
                      onTap: () {
                        // Navigate to privacy settings
                      },
                    ),
                    const SizedBox(height: 16),

                    // Help
                    _buildSettingsOption(
                      icon: Icons.help_outline,
                      title: 'Help',
                      onTap: () {
                        // Navigate to help settings
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Your Account Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Account',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Switch to other Account
                    GestureDetector(
                      onTap: () {
                        _showSwitchAccountDialog();
                      },
                      child: Text(
                        'Switch to other Account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Logout
                    GestureDetector(
                      onTap: () {
                        _showLogoutDialog();
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Divider
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.black87),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }

  void _showSwitchAccountDialog() {
    // Sample patients list
    List<Map<String, String>> patients = [
      {
        'name': 'Brian Lara',
        'email': 'brianlara@email.com',
      },
      {
        'name': 'Sophia Carter',
        'email': 'sophiacarter@gmail.com',
      },
      {
        'name': 'John Smith',
        'email': 'johnsmith@email.com',
      },
      {
        'name': 'Mary Johnson',
        'email': 'maryjohnson@email.com',
      },
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Patient'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: patients
                  .map(
                    (patient) => GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to patient dashboard
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PatientDashboard(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange.shade200,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patient['name']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    patient['email']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging out...')),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
