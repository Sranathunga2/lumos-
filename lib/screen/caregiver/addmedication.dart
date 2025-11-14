import 'package:flutter/material.dart';

class AddMedicationPage extends StatefulWidget {
  const AddMedicationPage({super.key});

  @override
  State<AddMedicationPage> createState() => _AddMedicationPageState();
}

class _AddMedicationPageState extends State<AddMedicationPage> {
  late TextEditingController _medicationNameController;
  late TextEditingController _dosageController;
  late TextEditingController _frequencyController;
  late TextEditingController _administrationRouteController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _instructionsController;

  @override
  void initState() {
    super.initState();
    _medicationNameController = TextEditingController();
    _dosageController = TextEditingController();
    _frequencyController = TextEditingController();
    _administrationRouteController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _instructionsController = TextEditingController();
  }

  @override
  void dispose() {
    _medicationNameController.dispose();
    _dosageController.dispose();
    _frequencyController.dispose();
    _administrationRouteController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toString().split(' ')[0];
      });
    }
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

  void _showAdministrationRouteDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Administration Route',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Oral'),
                onTap: () {
                  setState(() {
                    _administrationRouteController.text = 'Oral';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Intravenous'),
                onTap: () {
                  setState(() {
                    _administrationRouteController.text = 'Intravenous';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Injection'),
                onTap: () {
                  setState(() {
                    _administrationRouteController.text = 'Injection';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Topical'),
                onTap: () {
                  setState(() {
                    _administrationRouteController.text = 'Topical';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Inhalation'),
                onTap: () {
                  setState(() {
                    _administrationRouteController.text = 'Inhalation';
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

  void _saveMedication() {
    if (_medicationNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter medication name')),
      );
      return;
    }

    if (_dosageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter dosage')),
      );
      return;
    }

    if (_frequencyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select frequency')),
      );
      return;
    }

    if (_administrationRouteController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select administration route')),
      );
      return;
    }

    if (_startDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select start date')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Medication added successfully')),
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
          'Add Medication',
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
              // Medication Name Field
              _buildInputField(
                label: 'Medication Name',
                controller: _medicationNameController,
                hintText: 'e.g., Aspirin',
                onTap: null,
              ),

              const SizedBox(height: 20),

              // Dosage Field
              _buildInputField(
                label: 'Dosage (e.g., 20mg)',
                controller: _dosageController,
                hintText: 'e.g., 20mg',
                onTap: null,
              ),

              const SizedBox(height: 20),

              // Frequency Field
              _buildInputField(
                label: 'Frequency',
                controller: _frequencyController,
                hintText: 'Daily',
                onTap: _showFrequencyDropdown,
                isDropdown: true,
              ),

              const SizedBox(height: 20),

              // Administration Route Field
              _buildInputField(
                label: 'Administration Route',
                controller: _administrationRouteController,
                hintText: 'e.g., Oral',
                onTap: _showAdministrationRouteDropdown,
                isDropdown: true,
              ),

              const SizedBox(height: 20),

              // Start Date Field
              _buildInputField(
                label: 'Start Date',
                controller: _startDateController,
                hintText: 'YYYY-MM-DD',
                onTap: () => _selectDate(context, _startDateController),
                isDateField: true,
              ),

              const SizedBox(height: 20),

              // End Date Field (Optional)
              _buildInputField(
                label: 'End Date (Optional)',
                controller: _endDateController,
                hintText: 'YYYY-MM-DD',
                onTap: () => _selectDate(context, _endDateController),
                isDateField: true,
              ),

              const SizedBox(height: 20),

              // Special Instructions Field
              _buildInstructionsField(),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveMedication,
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required VoidCallback? onTap,
    bool isDropdown = false,
    bool isDateField = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    enabled: !isDropdown && !isDateField,
                    readOnly: isDropdown || isDateField,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (isDropdown)
                  Icon(Icons.arrow_drop_down, color: Colors.grey.shade600)
                else if (isDateField)
                  Icon(Icons.calendar_today, color: Colors.grey.shade600, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special Instruction and notes',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _instructionsController,
            maxLines: 6,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Add special instructions...',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
