import 'package:flutter/material.dart';

class CareCalendarPage extends StatefulWidget {
  const CareCalendarPage({super.key});

  @override
  State<CareCalendarPage> createState() => _CareCalendarPageState();
}

class _CareCalendarPageState extends State<CareCalendarPage> {
  late DateTime _currentDate;
  late DateTime _selectedDate;
  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<String> _dayNames = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  // Sample events data
  final Map<DateTime, List<Event>> _events = {
    DateTime(2024, 10, 15): [
      Event(
        title: 'Medication Reminder',
        time: '8:00 AM',
        icon: Icons.medical_services,
      ),
      Event(
        title: "Doctor's Appointment",
        time: '10:00 AM',
        icon: Icons.calendar_today,
      ),
      Event(
        title: 'Physical Therapy',
        time: '2:00 PM',
        icon: Icons.person,
      ),
      Event(
        title: 'Dinner',
        time: '6:00 PM',
        icon: Icons.restaurant,
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime(2024, 10, 1);
    _selectedDate = DateTime(2024, 10, 15);
  }

  int _getDaysInMonth(int year, int month) {
    if (month == 12) {
      return DateTime(year + 1, 1, 0).day;
    }
    return DateTime(year, month + 1, 0).day;
  }

  int _getFirstDayOfMonth(int year, int month) {
    return DateTime(year, month, 1).weekday % 7;
  }

  void _previousMonth() {
    setState(() {
      if (_currentDate.month == 1) {
        _currentDate = DateTime(_currentDate.year - 1, 12, 1);
      } else {
        _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
      }
    });
  }

  void _nextMonth() {
    setState(() {
      if (_currentDate.month == 12) {
        _currentDate = DateTime(_currentDate.year + 1, 1, 1);
      } else {
        _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = _getDaysInMonth(_currentDate.year, _currentDate.month);
    int firstDay = _getFirstDayOfMonth(_currentDate.year, _currentDate.month);

    List<Event> selectedEvents = _events[
            DateTime(
              _selectedDate.year,
              _selectedDate.month,
              _selectedDate.day,
            )] ??
        [];

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
                        'Care Calendar',
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

              // Month Navigation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: _previousMonth,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Text(
                      '${_monthNames[_currentDate.month - 1]} ${_currentDate.year}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: _nextMonth,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Calendar Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Day names
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _dayNames
                          .map((day) => SizedBox(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 12),

                    // Calendar dates
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: daysInMonth + firstDay,
                      itemBuilder: (context, index) {
                        if (index < firstDay) {
                          return const SizedBox();
                        }

                        int day = index - firstDay + 1;
                        DateTime date = DateTime(
                          _currentDate.year,
                          _currentDate.month,
                          day,
                        );
                        bool isSelected = _selectedDate.day == day &&
                            _selectedDate.month == _currentDate.month &&
                            _selectedDate.year == _currentDate.year;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? const Color(0xFF98B9FF)
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                day.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Selected Date and Events
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_monthNames[_selectedDate.month - 1]} ${_selectedDate.day}, ${_selectedDate.year}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Events List
                    if (selectedEvents.isEmpty)
                      Text(
                        'No events scheduled',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      )
                    else
                      Column(
                        children: selectedEvents
                            .map((event) => _buildEventItem(event))
                            .toList(),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add event functionality
          _showAddEventDialog();
        },
        backgroundColor: const Color(0xFF98B9FF),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildEventItem(Event event) {
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
                event.icon,
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
                    event.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    event.time,
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
    );
  }

  void _showAddEventDialog() {
    late TextEditingController titleController;
    late TextEditingController timeController;
    String selectedIcon = 'Medical';

    titleController = TextEditingController();
    timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Reminder'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Field
                    const Text(
                      'Reminder Title',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Enter reminder title',
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

                    // Time Field
                    const Text(
                      'Time',
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
                          setState(() {
                            timeController.text = picked.format(context);
                          });
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
                    const SizedBox(height: 16),

                    // Icon/Category Selection
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedIcon,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: [
                          'Medical',
                          'Appointment',
                          'Therapy',
                          'Meal',
                          'Other',
                        ]
                            .map(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  child: Text(value),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedIcon = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    titleController.dispose();
                    timeController.dispose();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        timeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                        ),
                      );
                      return;
                    }

                    // Get icon based on category
                    IconData icon;
                    switch (selectedIcon) {
                      case 'Medical':
                        icon = Icons.medical_services;
                        break;
                      case 'Appointment':
                        icon = Icons.calendar_today;
                        break;
                      case 'Therapy':
                        icon = Icons.person;
                        break;
                      case 'Meal':
                        icon = Icons.restaurant;
                        break;
                      default:
                        icon = Icons.notifications;
                    }

                    // Add event to the selected date
                    setState(() {
                      DateTime dateKey = DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                      );

                      if (_events[dateKey] == null) {
                        _events[dateKey] = [];
                      }

                      _events[dateKey]!.add(
                        Event(
                          title: titleController.text,
                          time: timeController.text,
                          icon: icon,
                        ),
                      );
                    });

                    Navigator.pop(context);
                    titleController.dispose();
                    timeController.dispose();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Reminder added successfully'),
                      ),
                    );
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class Event {
  final String title;
  final String time;
  final IconData icon;

  Event({
    required this.title,
    required this.time,
    required this.icon,
  });
}
