import 'package:flutter/material.dart';
import '../models/city_model.dart';
import '../widgets/city_card.dart';
import 'city_details_screen.dart';

// This is dummy favorites data for now
List<City> favoriteCities = [];

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),

      body:
          favoriteCities.isEmpty
              ? Center(
                child: Text(
                  'No favorites yet!',
                  style: TextStyle(fontSize: 20),
                ),
              )
              : ListView.builder(
                itemCount: favoriteCities.length,
                itemBuilder: (context, index) {
                  final city = favoriteCities[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CityCard(
                      city: city,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityDetailScreen(city: city),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
