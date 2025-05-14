import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tentwenty_assessment/nav_bar.dart';
import 'package:tentwenty_assessment/views/widget/custom_search.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final List<Map<String, String>> movies = [
    {'title': 'Free Guy', 'image': 'assets/images/free_guy.png'},
    {'title': "The King's Man", 'image': 'assets/images/kings_man.png'},
    {'title': 'Jojo Rabbit', 'image': 'assets/images/jojo_rabbit.png'},
  ];

  final List<Map<String, String>> categories = [
    {'title': 'Comedies', 'image': 'assets/images/1.png'},
    {'title': 'Crime', 'image': 'assets/images/2.png'},
    {'title': 'Family', 'image': 'assets/images/3.png'},
    {'title': 'Documentaries', 'image': 'assets/images/4.png'},
    {'title': 'Dramas', 'image': 'assets/images/1.png'},
    {'title': 'Fantasy', 'image': 'assets/images/2.png'},
    {'title': 'Holidays', 'image': 'assets/images/3.png'},
    {'title': 'Horror', 'image': 'assets/images/4.png'},
    {'title': 'Sci-Fi', 'image': 'assets/images/1.png'},
    {'title': 'Thriller', 'image': 'assets/images/3.png'},
  ];

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.2),
        child: SafeArea(
          child: SearchableAppBar(
            onSearchToggle: (isSearching) {
              setState(() {
                _isSearching = isSearching;
              });
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _isSearching
                    ? GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 1.5,
                          ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Image.asset(
                                categories[index]['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Positioned(
                                bottom: 0,
                                child: SizedBox(
                                  width:
                                      Get.width * 0.5 -
                                      12, // Adjust for grid padding
                                  height: 70,
                                  child: Image.asset(
                                    'assets/images/shadow.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: Get.height * 0.01,
                                left: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    categories[index]['title']!,
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
                    )
                    : ListView.builder(
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
