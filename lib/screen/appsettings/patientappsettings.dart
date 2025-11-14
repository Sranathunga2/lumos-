import 'package:flutter/material.dart';

class PatientAppSettings extends StatefulWidget {
  const PatientAppSettings({super.key});

  @override
  State<PatientAppSettings> createState() => _PatientAppSettingsState();
}

class _PatientAppSettingsState extends State<PatientAppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 24),
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
                      // Navigate to Notification settings
                    },
                  ),
                  const SizedBox(height: 12),

                  // Sound & Haptics
                  _buildSettingsOption(
                    icon: Icons.volume_up_outlined,
                    title: 'Sound & Haptics',
                    onTap: () {
                      // Navigate to Sound & Haptics settings
                    },
                  ),
                  const SizedBox(height: 12),

                  // Privacy
                  _buildSettingsOption(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy',
                    onTap: () {
                      // Navigate to Privacy settings
                    },
                  ),
                  const SizedBox(height: 12),

                  // Help
                  _buildSettingsOption(
                    icon: Icons.help_outline,
                    title: 'Help',
                    onTap: () {
                      // Navigate to Help page
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // Bottom Navigation Preview
            Container(
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home_outlined, color: Colors.grey.shade400, size: 28),
                      Icon(Icons.medication, color: Colors.grey.shade400, size: 28),
                      Icon(Icons.calendar_today_outlined, color: Colors.grey.shade400, size: 28),
                      Icon(Icons.person_outline, color: Colors.grey.shade400, size: 28),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
            Icon(
              icon,
              size: 24,
              color: Colors.black87,
            ),
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
            Icon(
              Icons.chevron_right,
              size: 24,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
