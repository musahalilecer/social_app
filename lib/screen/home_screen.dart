import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screen/account_screen.dart';
import 'package:social_app/screen/discovery_screen.dart';
import 'package:social_app/screen/message_screen.dart';
import 'add_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StoryBoard(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < 10; i++)
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "User Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN9BcO5C511VubVWLWcaXQKTYwaZTruASolQ&s'),
                            //  Icon(Icons.accessibility, size: 40),
                            const SizedBox(height: 8),
                            const Text(
                              "Comment for post",
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.comment, color: Colors.blue),
                                SizedBox(width: 8),
                                Icon(Icons.add_box_outlined,
                                    color: Colors.green),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget StoryBoard() {
  final List<Map<String, String>> stories = [
    {
      'image': 'https://randomuser.me/api/portraits/men/1.jpg',
      'label': 'Your Story',
      'isAdd': 'true',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      'label': 'Alice',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/3.jpg',
      'label': 'Bob',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/4.jpg',
      'label': 'Carol',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/5.jpg',
      'label': 'Dave',
    },
  ];

  return SizedBox(
    height: 110,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      itemCount: stories.length,
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        final story = stories[index];
        final isAdd = story['isAdd'] == 'true';
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.pinkAccent,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(story['image']!),
                  ),
                ),
                if (isAdd)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child:
                          const Icon(Icons.add, size: 20, color: Colors.white),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 70,
              // child: Text(
              //   story['label']!,
              //   style: const TextStyle(fontSize: 13),
              //   overflow: TextOverflow.ellipsis,
              //   textAlign: TextAlign.center,
              // ),
            ),
          ],
        );
      },
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    MyHomePage(),
    DiscoveryScreen(),
    AccountScreen(),
    MessageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Navigation App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discovery',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPost()),
          );
        },
        backgroundColor: Colors.yellow[400],
        child: const Icon(Icons.add, color: Colors.black),
        tooltip: 'Add Post',
      ),
    );
  }
}
