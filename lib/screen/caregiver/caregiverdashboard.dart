import 'package:flutter/material.dart';
import 'viewpatient.dart';
import 'addpatient.dart';
import 'caregiverprofile.dart';
import 'editcaregiverprofile.dart';
import '../appsettings/caregiverappsettings.dart';
import 'carecalender.dart';
import '../patient/patientdashboard.dart';

class CaregiverDashboard extends StatefulWidget {
  const CaregiverDashboard({super.key});

  @override
  State<CaregiverDashboard> createState() => _CaregiverDashboardState();
}

class _CaregiverDashboardState extends State<CaregiverDashboard> {
  int _selectedIndex = 3; // default to profile

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // ACCOUNT label
                const Text(
                  'ACCOUNT',
                  style: TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 1.2),
                ),
                const SizedBox(height: 12),

                // Account card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Leon Fernando',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Leonfernando@gmail.com',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),

                      // Edit icon in blue outline
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditCaregiverProfilePage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // PATIENT label
                const Text(
                  'PATIENT',
                  style: TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 1.2),
                ),
                const SizedBox(height: 12),

                // Patient cards horizontal
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // sample patient card
                        return Container(
                          width: 180,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 34,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: const NetworkImage(
                                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200&h=200&fit=crop',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text('Brian Lara', style: TextStyle(fontWeight: FontWeight.w700)),
                              const SizedBox(height: 4),
                              Text('Dementia', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ViewPatientPage(
                                        patientName: 'Brian Lara',
                                        patientEmail: 'brianlara@email.com',
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text('View Patient', style: TextStyle(color: Colors.blue[700], fontSize: 13)),
                                    const SizedBox(width: 6),
                                    Icon(Icons.arrow_forward, size: 14, color: Colors.blue[700]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      // Add patient card
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddPatientPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: IconButton(
                                  icon: Icon(Icons.add, size: 30, color: Colors.blue[700]),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const AddPatientPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text('Add Patient', style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'APP SETTINGS',
                  style: TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 1.2),
                ),
                const SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    title: const Text('App Settings', style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CaregiverAppSettingsPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Switch to patient account link
                GestureDetector(
                  onTap: () {
                    _showSwitchToPatientsDialog();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Swith to patient account', style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w500)),
                  ),
                ),

                const SizedBox(height: 28),

              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CareCalendarPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CaregiverProfilePage(),
              ),
            );
          }
        },
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

  void _showSwitchToPatientsDialog() {
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
}
