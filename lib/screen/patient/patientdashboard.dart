import 'package:flutter/material.dart';
import 'medication.dart';
import 'calender.dart';
import 'patientprofile.dart';
import 'emergencycall.dart';
import '../appsettings/patientappsettings.dart';
import 'medicationdetails.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Debug log to verify navigation target
    // When this screen is opened you should see this in the console
    // -> "PatientDashboard opened"
    // This helps confirm which dashboard is actually shown at runtime.
    // Remove this after debugging.
    // ignore: avoid_print
    print('PatientDashboard opened');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientAppSettings(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: const Text('Patient Dashboard', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text('Upcoming Appointments', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 12),

              // Appointments
              Column(
                children: const [
                  _AppointmentItem(
                    title: 'General Checkup',
                    subtitle: 'Dr. Amelia Carter',
                    date: 'July 15, 2024',
                  ),
                  SizedBox(height: 8),
                  _AppointmentItem(
                    title: 'Physical Therapy',
                    subtitle: 'Dr. Noah Thompson',
                    date: 'July 22, 2024',
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text('Current Medications', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 12),

              // Medications
              Column(
                children: [
                  _MedicationItem(
                    name: 'Lisinopril',
                    dose: '10mg, Once Daily',
                    notes: 'Take with food',
                    pillsLeft: '30 pills left',
                    frequency: 'Once daily',
                    administrationRoute: 'Oral',
                    startDate: '2024-01-15',
                    endDate: '2024-07-15',
                    instructions: 'Take with food. Avoid grapefruit juice.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicationDetailsPage(
                            medicationName: 'Lisinopril',
                            dosage: '10mg, Once Daily',
                            frequency: 'Once daily',
                            administrationRoute: 'Oral',
                            startDate: '2024-01-15',
                            endDate: '2024-07-15',
                            instructions: 'Take with food. Avoid grapefruit juice.',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _MedicationItem(
                    name: 'Metformin',
                    dose: '500mg, Twice Daily',
                    notes: 'Take after meals',
                    pillsLeft: '60 pills left',
                    frequency: 'Twice daily',
                    administrationRoute: 'Oral',
                    startDate: '2024-01-20',
                    endDate: '2024-12-20',
                    instructions: 'Take after meals. Do not crush tablets.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicationDetailsPage(
                            medicationName: 'Metformin',
                            dosage: '500mg, Twice Daily',
                            frequency: 'Twice daily',
                            administrationRoute: 'Oral',
                            startDate: '2024-01-20',
                            endDate: '2024-12-20',
                            instructions: 'Take after meals. Do not crush tablets.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text('Recent Updates', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 12),
              Column(
                children: const [
                  _UpdateItem(title: 'Lab Results', subtitle: 'Lab results are normal', timeAgo: '2 days ago'),
                  SizedBox(height: 8),
                  _UpdateItem(title: 'Appointment Reminder', subtitle: 'Schedule your next visit', timeAgo: '1 week ago'),
                ],
              ),

              const SizedBox(height: 20),
              Text('Care Team', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 12),

              // Care team list
              Column(
                children: [
                  _CareTeamItem(
                    name: 'Amelia Carter',
                    role: 'Daughter',
                    phoneNumber: '+1 (555) 123-4567',
                  ),
                  const SizedBox(height: 8),
                  _CareTeamItem(
                    name: 'Dr. John',
                    role: 'Doctor',
                    phoneNumber: '+1 (555) 987-6543',
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      _showAddCareTeamMemberDialog();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    child: const Text('Add Person to Care Team'),
                  ),
                ],
              ),

              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() => _selectedIndex = i);
          
          // Navigate to Medications page when index is 1
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MedicationPage(),
              ),
            );
          }
          // Navigate to Calendar page when index is 2
          else if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalendarPage(),
              ),
            );
          }
          // Navigate to Profile page when index is 3
          else if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientProfilePage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Medications'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calender'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void _showAddCareTeamMemberDialog() {
    late TextEditingController nameController;
    late TextEditingController roleController;
    late TextEditingController phoneController;

    nameController = TextEditingController();
    roleController = TextEditingController();
    phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Care Team Member'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Role Field
                const Text(
                  'Role/Relationship',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(
                    hintText: 'e.g., Doctor, Family Member, Nurse',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Phone Number Field
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                nameController.dispose();
                roleController.dispose();
                phoneController.dispose();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    roleController.text.isEmpty ||
                    phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                    ),
                  );
                  return;
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${nameController.text} has been added to your care team',
                    ),
                  ),
                );

                nameController.dispose();
                roleController.dispose();
                phoneController.dispose();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class _AppointmentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  const _AppointmentItem({required this.title, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.event_note, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
        Text(date, style: TextStyle(color: Colors.grey.shade700)),
      ],
    );
  }
}

class _MedicationItem extends StatelessWidget {
  final String name;
  final String dose;
  final String notes;
  final String pillsLeft;
  final String frequency;
  final String administrationRoute;
  final String startDate;
  final String endDate;
  final String instructions;
  final VoidCallback onTap;

  const _MedicationItem({
    required this.name,
    required this.dose,
    required this.notes,
    required this.pillsLeft,
    required this.frequency,
    required this.administrationRoute,
    required this.startDate,
    required this.endDate,
    required this.instructions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.medication, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(dose, style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 4),
                Text(notes, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
          ),
          Text(pillsLeft, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}

class _UpdateItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeAgo;

  const _UpdateItem({required this.title, required this.subtitle, required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.insert_drive_file, color: Colors.teal),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
        Text(timeAgo, style: TextStyle(color: Colors.grey.shade500)),
      ],
    );
  }
}

class _CareTeamItem extends StatelessWidget {
  final String name;
  final String role;
  final String? phoneNumber;

  const _CareTeamItem({
    required this.name,
    required this.role,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to emergency call page when care team member is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmergencyCallPage(
              contactName: name,
              contactRelation: role,
              phoneNumber: phoneNumber ?? '+1234567890',
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.teal.shade100,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                if (role.isNotEmpty) Text(role, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigate to emergency call page when call button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmergencyCallPage(
                    contactName: name,
                    contactRelation: role,
                    phoneNumber: phoneNumber ?? '+1234567890',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.call),
          ),
        ],
      ),
    );
  }
}
