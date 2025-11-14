import 'package:flutter/material.dart';

class EmergencyCallPage extends StatefulWidget {
  final String contactName;
  final String contactRelation;
  final String phoneNumber;
  final String? profileImagePath;

  const EmergencyCallPage({
    super.key,
    required this.contactName,
    required this.contactRelation,
    required this.phoneNumber,
    this.profileImagePath,
  });

  @override
  State<EmergencyCallPage> createState() => _EmergencyCallPageState();
}

class _EmergencyCallPageState extends State<EmergencyCallPage> {
  void _makePhoneCall() {
    // For now, show a dialog
    _showCallDialog();
  }

  void _showCallDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Call'),
          content: Text('Calling ${widget.contactName}...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Title
            const Text(
              'Emergency call',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 60),

            // Contact Profile Picture
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
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
                            color: Colors.grey,
                          );
                        },
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
            ),

            const SizedBox(height: 30),

            // Contact Name
            Text(
              widget.contactName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            // Contact Relation
            Text(
              widget.contactRelation,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 80),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Video Call Button
                _buildActionButton(
                  icon: Icons.videocam_outlined,
                  onPressed: () {
                    // Video call action
                    _showFeatureDialog('Video Call');
                  },
                ),

                // Phone Call Button
                _buildActionButton(
                  icon: Icons.phone,
                  onPressed: _makePhoneCall,
                  isMainAction: true,
                ),

                // Voice Call Button
                _buildActionButton(
                  icon: Icons.phone_missed_outlined,
                  onPressed: () {
                    // Voice call action
                    _showFeatureDialog('Voice Call');
                  },
                ),
              ],
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isMainAction = false,
  }) {
    return Container(
      width: isMainAction ? 80 : 70,
      height: isMainAction ? 80 : 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isMainAction ? const Color(0xFF4CAF50) : Colors.grey.shade300,
        boxShadow: isMainAction
            ? [
                BoxShadow(
                  color: const Color(0xFF4CAF50).withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            color: isMainAction ? Colors.white : Colors.black87,
            size: isMainAction ? 36 : 28,
          ),
        ),
      ),
    );
  }

  void _showFeatureDialog(String featureName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(featureName),
          content: Text('$featureName with ${widget.contactName} initiated...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
