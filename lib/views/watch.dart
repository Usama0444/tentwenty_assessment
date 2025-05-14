import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    {'title': 'Comedies', 'image': 'assets/images/1.png', 'category': 'Comedy'},
    {'title': 'Crime', 'image': 'assets/images/2.png', 'category': 'Crime'},
    {'title': 'Family', 'image': 'assets/images/3.png', 'category': 'Family'},
    {
      'title': 'Documentaries',
      'image': 'assets/images/4.png',
      'category': 'Documentary',
    },
    {'title': 'Dramas', 'image': 'assets/images/1.png', 'category': 'Drama'},
    {'title': 'Fantasy', 'image': 'assets/images/2.png', 'category': 'Fantasy'},
    {
      'title': 'Holidays',
      'image': 'assets/images/3.png',
      'category': 'Holiday',
    },
    {'title': 'Horror', 'image': 'assets/images/4.png', 'category': 'Horror'},
    {'title': 'Sci-Fi', 'image': 'assets/images/1.png', 'category': 'Sci-Fi'},
    {
      'title': 'Thriller',
      'image': 'assets/images/3.png',
      'category': 'Thriller',
    },
  ];

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> getFilteredItems() {
    if (_searchController.text.isEmpty) return [];
    return categories
        .where(
          (item) => item['title']!.toLowerCase().contains(
            _searchController.text.toLowerCase(),
          ),
        )
        .toList();
  }

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
            searchController: _searchController,
            onSearchTextChanged: () {
              setState(() {});
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _isSearching
                    ? _searchController.text.isNotEmpty
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Results",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${getFilteredItems().length} Results Found",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                itemCount: getFilteredItems().length,
                                itemBuilder: (context, index) {
                                  final item = getFilteredItems()[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          child: Image.asset(
                                            item['image']!,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(width: 16.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['title']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Text(
                                                item['category']!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PopupMenuButton<String>(
                                          icon: Row(
                                            children: List.generate(
                                              3,
                                              (index) => Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                ),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 8,
                                                  color: Colors.blue[300],
                                                ),
                                              ),
                                            ),
                                          ),
                                          onSelected: (String result) {
                                            switch (result) {
                                              case 'Edit':
                                                print("Edit action triggered");
                                                // Add edit functionality here
                                                break;
                                              case 'Delete':
                                                print(
                                                  "Delete action triggered",
                                                );
                                                // Add delete functionality here
                                                break;
                                              case 'View':
                                                print("View action triggered");
                                                // Add view functionality here
                                                break;
                                            }
                                          },
                                          itemBuilder:
                                              (BuildContext context) =>
                                                  <PopupMenuEntry<String>>[
                                                    const PopupMenuItem<String>(
                                                      value: 'Action 1',
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(width: 8.0),
                                                          Text('Action 1'),
                                                        ],
                                                      ),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'Action 2',
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(width: 8.0),
                                                          Text('Action 2'),
                                                        ],
                                                      ),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'Action 2',
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(width: 8.0),
                                                          Text('Action 3'),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                        : GridView.builder(
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
                                      width: Get.width * 0.5 - 12,
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
