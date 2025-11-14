import 'package:flutter/material.dart';
import '../patient/medicationdetails.dart';
import 'setalarm.dart';
import 'addmedication.dart';
import 'patientremove.dart';

class ViewPatientPage extends StatefulWidget {
  final String patientName;
  final String patientEmail;
  final String? profileImagePath;

  const ViewPatientPage({
    super.key,
    required this.patientName,
    required this.patientEmail,
    this.profileImagePath,
  });

  @override
  State<ViewPatientPage> createState() => _ViewPatientPageState();
}

class _ViewPatientPageState extends State<ViewPatientPage> {
  // Sample medications data
  List<Medication> medications = [
    Medication(
      name: 'Ibuprofen',
      dosage: '250mg',
      frequency: 'Every 6 hours',
      administrationRoute: 'Oral',
      startDate: '2024-01-10',
      endDate: '2024-12-31',
      instructions: 'Take with food. Do not exceed 1200mg per day.',
    ),
    Medication(
      name: 'Acetaminophen',
      dosage: '500mg',
      frequency: 'Every 8 hours',
      administrationRoute: 'Oral',
      startDate: '2024-01-15',
      endDate: '2024-06-30',
      instructions: 'Take every 8 hours as needed. Do not exceed 3000mg per day.',
    ),
    Medication(
      name: 'Loratadine',
      dosage: '10mg',
      frequency: 'Once daily',
      administrationRoute: 'Oral',
      startDate: '2024-02-01',
      endDate: '2024-08-31',
      instructions: 'Take once daily, preferably in the morning.',
    ),
  ];

  // Sample alarms data
  List<String> alarms = ['08:00 A.M', '12:00 PM', '06:00 PM'];

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
                      'Patient Details',
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

            const SizedBox(height: 20),

            // Patient Profile Section
            Center(
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange.shade200,
                    ),
                    child: widget.profileImagePath != null
                        ? ClipOval(
                            child: Image.asset(
                              widget.profileImagePath!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white,
                                );
                              },
                            ),
                          )
                        : const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Patient Name
                  Text(
                    widget.patientName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Patient Email
                  Text(
                    widget.patientEmail,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Medications Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Medications List
                  Column(
                    children: medications
                        .map((med) => _buildMedicationItem(med))
                        .toList(),
                  ),

                  const SizedBox(height: 12),

                  // Add Medication Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Navigate to Add Medication page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddMedicationPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Medication'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.grey.shade100,
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Alarms Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarms',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Alarms List
                  Column(
                    children: alarms
                        .map((alarm) => _buildAlarmItem(alarm))
                        .toList(),
                  ),

                  const SizedBox(height: 12),

                  // Add Alarm Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Navigate to Set Alarm page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetAlarmPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Alarm'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.grey.shade100,
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Remove Patient Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Remove Patient page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemovePatientPage(
                          patientName: widget.patientName,
                          patientEmail: widget.patientEmail,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Remove Patient',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationItem(Medication med) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to medication details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicationDetailsPage(
                medicationName: med.name,
                dosage: med.dosage,
                frequency: med.frequency,
                administrationRoute: med.administrationRoute,
                startDate: med.startDate,
                endDate: med.endDate,
                instructions: med.instructions,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.medication,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      med.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      med.dosage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigate to medication details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicationDetailsPage(
                        medicationName: med.name,
                        dosage: med.dosage,
                        frequency: med.frequency,
                        administrationRoute: med.administrationRoute,
                        startDate: med.startDate,
                        endDate: med.endDate,
                        instructions: med.instructions,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit_outlined, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmItem(String alarm) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.access_time,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                alarm,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _showEditAlarmDialog(alarm);
              },
              icon: const Icon(Icons.edit_outlined, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditAlarmDialog(String alarm) {
    late TextEditingController timeController;
    timeController = TextEditingController(text: alarm);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Alarm'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alarm Time',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      timeController.text = picked.format(context);
                    }
                  },
                  child: TextField(
                    controller: timeController,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'Select time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      suffixIcon: const Icon(Icons.access_time),
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
                timeController.dispose();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Alarm'),
                      content: const Text('Are you sure you want to delete this alarm?'),
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
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Alarm deleted successfully'),
                              ),
                            );
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                timeController.dispose();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Alarm updated successfully'),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Medication {
  final String name;
  final String dosage;
  final String frequency;
  final String administrationRoute;
  final String startDate;
  final String endDate;
  final String instructions;

  Medication({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.administrationRoute,
    required this.startDate,
    required this.endDate,
    required this.instructions,
  });
}
