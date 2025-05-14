import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/kings_man.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: Get.height * 0.6,
                ),
                Positioned(
                  top: Get.height * 0.07,
                  left: 16,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Watch',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Image.asset(
                    'assets/images/shadow.png',
                    width: Get.width,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 50,
                      ),
                      Text(
                        'In theaters december 22, 2021',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * 0.6,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff61C3F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'Get Tickets',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * 0.6,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              Text(
                                'Watch Trailer',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genres',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Wrap(
                        spacing: 8.0,
                        children: [
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              'Action',
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            backgroundColor: Color(0xff15D2BC),
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              'Thriller',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.pink,
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              'Science',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Color(0xff564CA3),
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              'Fiction',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Color(0xffCD9D0F),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Overview',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'As a collection of history\'s worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King\'s Man. The comic book "The Secret Service" by Mark Millar and Dave Gibbons.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCastCard(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
