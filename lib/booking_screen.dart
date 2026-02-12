import 'package:flutter/material.dart';
import 'summary_screen.dart'; // Is page ko agle step mein finalize karenge

class BookingScreen extends StatefulWidget {
  final String serviceName;
  const BookingScreen({super.key, required this.serviceName});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  // Time Slots ki list
  final List<String> _timeSlots = [
    "09:00 AM", "10:00 AM", "11:00 AM",
    "12:00 PM", "02:00 PM", "03:00 PM",
    "04:00 PM", "05:00 PM", "06:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent Light Blue AppBar jo humne pehle fix kiya tha
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("Select Slot", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Info
            Text(
              "Booking for ${widget.serviceName}",
              style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25),

            // 2. Horizontal Date Picker
            const Text("Select Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildHorizontalDatePicker(),

            const SizedBox(height: 35),

            // 3. Time Slots Grid
            const Text("Available Time Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedTime == _timeSlots[index];
                return GestureDetector(
                  onTap: () => setState(() => selectedTime = _timeSlots[index]),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blueAccent : Colors.white,
                      border: Border.all(color: isSelected ? Colors.blueAccent : Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isSelected ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 5)] : [],
                    ),
                    child: Text(
                      _timeSlots[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // 4. Confirm Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: (selectedTime.isEmpty)
              ? null
              : () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SummaryScreen(
                  serviceName: widget.serviceName,
                  selectedDate: "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                  selectedTime: selectedTime,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            disabledBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text("Confirm & Continue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  // --- Horizontal Date Picker Widget ---
  Widget _buildHorizontalDatePicker() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7, // Next 7 days
        itemBuilder: (context, index) {
          DateTime date = DateTime.now().add(Duration(days: index));
          bool isSelected = selectedDate.day == date.day;

          return GestureDetector(
            onTap: () => setState(() => selectedDate = date),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: isSelected ? Colors.blueAccent : Colors.grey.shade300),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayName(date.weekday),
                    style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getDayName(int day) {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[day - 1];
  }
}