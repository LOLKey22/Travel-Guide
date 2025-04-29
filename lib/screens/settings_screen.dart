import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart'; // To clear favorites
import '../screens/profile_screen.dart'; // To update avatar globally (we will modify Profile too)

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _changeProfilePicture() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Choose Profile Picture'),
            content: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _avatarOption(
                    'https://cdn-icons-png.flaticon.com/512/4333/4333609.png',
                  ),
                  _avatarOption(
                    'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
                  ),
                  _avatarOption(
                    'https://cdn-icons-png.flaticon.com/512/4140/4140051.png',
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _avatarOption(String imageUrl) {
    return GestureDetector(
      onTap: () {
        selectedAvatarUrl = imageUrl; // Update global variable
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile picture changed!')),
        );
      },
      child: CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl)),
    );
  }

  void _clearFavorites() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear All Favorites?'),
            content: const Text(
              'Are you sure you want to remove all favorite cities?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  favoriteCities.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All favorite cities cleared!'),
                    ),
                  );
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }

  void _contactSupport() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Contact Support'),
            content: const Text(
              'Email: support@travelguide.com\nPhone: +123-456-7890',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showAppVersion() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('App Version'),
            content: const Text(
              'Travel Guide v1.0\n© 2025 All rights reserved.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.image, color: Colors.teal),
            title: const Text('Change Profile Picture'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: _changeProfilePicture,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.teal),
            title: const Text('Clear Favorite Cities'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: _clearFavorites,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.support_agent, color: Colors.teal),
            title: const Text('Contact Support'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: _contactSupport,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.teal),
            title: const Text('App Version'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: _showAppVersion,
          ),
        ],
      ),
    );
  }
}
