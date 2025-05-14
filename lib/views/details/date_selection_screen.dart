import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateSelectionScreen extends StatelessWidget {
  const DateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('The King\'s Man'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'In Theaters December 22, 2021',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDateButton(context, '5 Mar'),
                    _buildDateButton(context, '6 Mar'),
                    _buildDateButton(context, '7 Mar', isSelected: true),
                    _buildDateButton(context, '8 Mar'),
                    _buildDateButton(context, '9 Mar'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '12:30 Cinetec + Hall 1',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text('13:30 Cinetec', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'From 50\$ or 2500 bonus',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to(() => SeatSelectionScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Select Seats'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton(
    BuildContext context,
    String date, {
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue[300] : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(date),
      ),
    );
  }
}

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('The King\'s Man'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'March 5, 2021 | 12:30 Hall 1',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/1.png', // Placeholder for screen image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: 100, // Example seat count
                itemBuilder: (context, index) {
                  bool isSelected = index == 22; // Example selected seat
                  bool isAvailable =
                      index % 5 != 0; // Example unavailable seats
                  return GestureDetector(
                    onTap: isAvailable ? () {} : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.orange
                                : isAvailable
                                ? Colors.blue[300]
                                : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(width: 20, height: 20, color: Colors.orange),
                      const SizedBox(width: 8),
                      Text('Selected'),
                      const SizedBox(width: 16),
                      Container(width: 20, height: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text('Not available'),
                      const SizedBox(width: 16),
                      Container(width: 20, height: 20, color: Colors.blue[300]),
                      const SizedBox(width: 8),
                      Text('VIP (150\$)'),
                      const SizedBox(width: 16),
                      Container(width: 20, height: 20, color: Colors.blue[100]),
                      const SizedBox(width: 8),
                      Text('Regular (50\$)'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('4 / 4 row'),
                      IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$200',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Proceed to pay'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
