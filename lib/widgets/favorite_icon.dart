import 'package:flutter/material.dart';
import '../models/city_model.dart';
import '../screens/favorites_screen.dart'; // To access favoriteCities list

class FavoriteIcon extends StatefulWidget {
  final City city;

  const FavoriteIcon({super.key, required this.city});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = favoriteCities.contains(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
          if (isFavorite) {
            favoriteCities.add(widget.city);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to Favorites!')),
            );
          } else {
            favoriteCities.remove(widget.city);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Removed from Favorites!')),
            );
          }
        });
      },
    );
  }
}
