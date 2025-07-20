import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_post.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('john_doe'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Your action here, e.g., navigate to AddPost screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPost()),
              );
            },
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.lightGreen[200],
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: const AccountScreenPage(),
      backgroundColor: Colors.white,
    );
  }
}

class AccountScreenPage extends StatelessWidget {
  const AccountScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          // Profile picture and stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Profile picture
              const CircleAvatar(
                radius: 44,
                backgroundImage:
                    NetworkImage('https://example.com/user_profile_image.png'),
              ),
              // Stats
              Row(
                children: [
                  _buildStatColumn('Posts', '24'),
                  const SizedBox(width: 24),
                  _buildStatColumn('Followers', '1.2K'),
                  const SizedBox(width: 24),
                  _buildStatColumn('Following', '180'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Username
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                )),
          ),
          // Bio
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Flutter developer | Coffee lover | Dreamer',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Edit Profile Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Edit Profile',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Post grid placeholder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemCount: 12, // Placeholder count
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child:
                      const Icon(Icons.image, color: Colors.white54, size: 40),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
