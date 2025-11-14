import 'package:flutter/material.dart';

class EditCaregiverProfilePage extends StatefulWidget {
  const EditCaregiverProfilePage({super.key});

  @override
  State<EditCaregiverProfilePage> createState() =>
      _EditCaregiverProfilePageState();
}

class _EditCaregiverProfilePageState extends State<EditCaregiverProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _idController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _specializationController;
  late TextEditingController _schoolController;
  late TextEditingController _experienceController;
  late TextEditingController _hospitalController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Dr.Amelia Harper');
    _idController = TextEditingController(text: '34257883');
    _phoneController = TextEditingController(text: '077 8474837');
    _emailController = TextEditingController(text: 'Ameliaharper@gmail.com');
    _specializationController =
        TextEditingController(text: 'specialize in dementia');
    _schoolController = TextEditingController(text: 'Harvard medical school');
    _experienceController = TextEditingController(text: '10');
    _hospitalController = TextEditingController(text: '123,medical center');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _specializationController.dispose();
    _schoolController.dispose();
    _experienceController.dispose();
    _hospitalController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
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
              // Name Field
              _buildInputField(
                label: 'Full Name',
                controller: _nameController,
                hintText: 'Enter your full name',
              ),

              const SizedBox(height: 20),

              // ID Field (Read-only)
              _buildInputField(
                label: 'ID',
                controller: _idController,
                hintText: 'Your ID',
                readOnly: true,
              ),

              const SizedBox(height: 20),

              // Phone Field
              _buildInputField(
                label: 'Phone Number',
                controller: _phoneController,
                hintText: 'Enter your phone number',
              ),

              const SizedBox(height: 20),

              // Email Field
              _buildInputField(
                label: 'Email',
                controller: _emailController,
                hintText: 'Enter your email',
              ),

              const SizedBox(height: 20),

              // Specialization Field
              _buildInputField(
                label: 'Specialization',
                controller: _specializationController,
                hintText: 'Enter your specialization',
              ),

              const SizedBox(height: 20),

              // Medical School Field
              _buildInputField(
                label: 'Medical School',
                controller: _schoolController,
                hintText: 'Enter your medical school',
              ),

              const SizedBox(height: 20),

              // Experience Field
              _buildInputField(
                label: 'Years of Experience',
                controller: _experienceController,
                hintText: 'Enter years of experience',
                inputType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              // Hospital Field
              _buildInputField(
                label: 'Current Hospital',
                controller: _hospitalController,
                hintText: 'Enter your current hospital',
              ),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF98B9FF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Color(0xFF98B9FF), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF98B9FF),
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
    bool readOnly = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      ],
    );
  }
}
