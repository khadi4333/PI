// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePageContent(),
    FavoritePage(),
    CarPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.directions_car, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}




class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<Car> cars = [
    Car(
      name: "Voiture 1",
      description: "Description de la voiture 1.",
      price: 25000,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Um1n_zfS_WfHjaFcqeMxs51ax3aDEaqECah6-3BBSb5MH8gSdYkDVtREKcLvVP93NHY&usqp=CAU",
    ),
    Car(
      name: "Voiture 2",
      description: "Description de la voiture 2.",
      price: 30000,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShAg_R54aavMZwOvGAgPNXoJumZuvrIN118GziumQlaaFNcJyxNvipj-GUPBuieQqsbW8&usqp=CAU",
    ),
    Car(
      name: "Voiture 3",
      description: "Description de la voiture 3.",
      price: 20000,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShAg_R54aavMZwOvGAgPNXoJumZuvrIN118GziumQlaaFNcJyxNvipj-GUPBuieQqsbW8&usqp=CAU",
    ),
    // Add more cars as needed
  ];

  List<Car> favoriteCars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Voitures"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarListItem(
            car: cars[index],
            onFavoritePressed: () {
              // Handle the favorite icon tap
              // Toggle the favorite status of the car
              setState(() {
                cars[index].isFavorite = !cars[index].isFavorite;

                // Add/remove the car from the favorite list
                if (cars[index].isFavorite) {
                  favoriteCars.add(cars[index]);
                } else {
                  favoriteCars.remove(cars[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the logic for publishing a car
          // This can navigate to a new screen or show a dialog, for example
          print("Publish a Car");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class Car {
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  bool isFavorite; // New property to track if the car is a favorite

  Car({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class CarListItem extends StatelessWidget {
  final Car car;
  final VoidCallback onFavoritePressed;

  const CarListItem({
    required this.car,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            car.imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(car.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price: \$${car.price}"),
                Text(car.description),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                car.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: onFavoritePressed,
            ),
          ),
        ],
      ),
    );
  }
}
class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Favoris"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("Favorite Page Content"),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("Settings Page Content"),
      ),
    );
  }
}

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Voitures"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("Car Page Content"),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
