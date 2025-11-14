import 'package:flutter/material.dart';
import 'patientdashboard.dart';
import 'calender.dart';
import 'patientprofile.dart';
import 'medicationdetails.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  int _selectedIndex = 1; // Start with Medications tab selected

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
              child: Text(
                "Today's Medications",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Illustration
            Center(
              child: Container(
                height: 250,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/medication_illustration.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.medication, size: 60, color: Colors.grey.shade400),
                          const SizedBox(height: 8),
                          Text(
                            'Medication Reminder',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Today's Medications Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Aspirin
                  _buildMedicationCard(
                    icon: '💊',
                    backgroundColor: Colors.grey.shade200,
                    name: 'Aspirin',
                    dosage: '100mg',
                    time: '8.00 AM',
                  ),
                  const SizedBox(height: 16),

                  // Lisinopril
                  _buildMedicationCard(
                    icon: '❤️',
                    backgroundColor: const Color(0xFFFF1744),
                    name: 'Lisinopril',
                    dosage: '20mg',
                    time: '9.00 AM',
                    isIconOverlay: true,
                  ),
                  const SizedBox(height: 16),

                  // Metformin
                  _buildMedicationCard(
                    icon: '💛',
                    backgroundColor: const Color(0xFFFFD600),
                    name: 'Metformin',
                    dosage: '500mg',
                    time: '10.00 AM',
                    isIconOverlay: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Upcoming Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildMedicationCard(
                icon: '💊',
                backgroundColor: const Color(0xFF1A237E),
                name: 'Atorvastatin',
                dosage: '10mg',
                time: 'Tomorrow\n7.00 AM',
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade400,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          
          // Navigate to Dashboard when Home button is clicked
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientDashboard(),
              ),
            );
          }
          // Navigate to Calendar when Calendar button is clicked
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalendarPage(),
              ),
            );
          }
          // Navigate to Profile when Profile button is clicked
          else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientProfilePage(),
              ),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationCard({
    required String icon,
    required Color backgroundColor,
    required String name,
    required String dosage,
    required String time,
    bool isIconOverlay = false,
    String frequency = 'Once daily',
    String administrationRoute = 'Oral',
    String startDate = '2024-01-15',
    String endDate = '2024-07-15',
    String instructions = 'Take with food. Avoid grapefruit juice.',
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicationDetailsPage(
              medicationName: name,
              dosage: dosage,
              frequency: frequency,
              administrationRoute: administrationRoute,
              startDate: startDate,
              endDate: endDate,
              instructions: instructions,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Icon/Box
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (isIconOverlay)
                  Positioned(
                    right: -8,
                    bottom: -8,
                    child: Text(
                      icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),

            // Medicine Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dosage,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Time
            Text(
              time,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
