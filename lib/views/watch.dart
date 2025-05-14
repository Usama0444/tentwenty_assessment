import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:tentwenty_assessment/nav_bar.dart';
import 'package:tentwenty_assessment/views/widget/custom_search.dart';

class WatchScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {'title': 'Free Guy', 'image': 'assets/images/free_guy.png'},
    {'title': "The King's Man", 'image': 'assets/images/kings_man.png'},
    {'title': 'Jojo Rabbit', 'image': 'assets/images/jojo_rabbit.png'},
  ];

  WatchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.2),
        child: SafeArea(child: SearchableAppBar()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        movies[index]['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: Get.height * 0.24,
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: Get.width,
                          height: 70,
                          child: Image.asset(
                            'assets/images/shadow.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: Get.height * 0.02,
                        left: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movies[index]['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 1,
        onItemTapped: (int index) {},
      ),
    );
  }
}
