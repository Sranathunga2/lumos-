import 'package:flutter/material.dart';

class SetAlarmPage extends StatefulWidget {
  const SetAlarmPage({super.key});

  @override
  State<SetAlarmPage> createState() => _SetAlarmPageState();
}

class _SetAlarmPageState extends State<SetAlarmPage> {
  late TextEditingController _timeController;
  late TextEditingController _medicationController;
  late TextEditingController _frequencyController;
  late TextEditingController _notesController;
  bool _alarmEnabled = false;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(text: '10:00 AM');
    _medicationController = TextEditingController(text: 'Select Medication');
    _frequencyController = TextEditingController(text: 'Daily');
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _timeController.dispose();
    _medicationController.dispose();
    _frequencyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void _showMedicationDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Medication',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Aspirin'),
                onTap: () {
                  setState(() {
                    _medicationController.text = 'Aspirin';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Lisinopril'),
                onTap: () {
                  setState(() {
                    _medicationController.text = 'Lisinopril';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Metformin'),
                onTap: () {
                  setState(() {
                    _medicationController.text = 'Metformin';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Ibuprofen'),
                onTap: () {
                  setState(() {
                    _medicationController.text = 'Ibuprofen';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFrequencyDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Frequency',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Once'),
                onTap: () {
                  setState(() {
                    _frequencyController.text = 'Once';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Daily'),
                onTap: () {
                  setState(() {
                    _frequencyController.text = 'Daily';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Twice a day'),
                onTap: () {
                  setState(() {
                    _frequencyController.text = 'Twice a day';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Three times a day'),
                onTap: () {
                  setState(() {
                    _frequencyController.text = 'Three times a day';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Weekly'),
                onTap: () {
                  setState(() {
                    _frequencyController.text = 'Weekly';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveAlarm() {
    if (_medicationController.text == 'Select Medication') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a medication')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Alarm set successfully')),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close, color: Colors.black, size: 28),
        ),
        centerTitle: true,
        title: const Text(
          'Set Alarm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time Section
              const Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _timeController.text,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Medication Section
              const Text(
                'Medication',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _showMedicationDropdown,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _medicationController.text,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Frequency Section
              const Text(
                'Frequency',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _showFrequencyDropdown,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _frequencyController.text,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Notes Section
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _notesController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add notes...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Alarm Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Alarm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Switch(
                    value: _alarmEnabled,
                    onChanged: (value) {
                      setState(() {
                        _alarmEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF98B9FF),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveAlarm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF98B9FF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
