import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/favorites_provider.dart'; 
class FavoritesScreen extends StatelessWidget { 
const FavoritesScreen({super.key}); 
@override 
Widget build(BuildContext context) { 
// Use context.watch to listen for changes to the favorites list. 
final favoritesProvider = context.watch<FavoritesProvider>(); 
final favoriteIndices = favoritesProvider.favorites; 
return Scaffold( 
appBar: AppBar( 
// The title also watches the provider to show a live count. 
title: Text('Your Favorites (${favoritesProvider.favoriteCount})'), 
), 
body: favoriteIndices.isEmpty 
// Show a placeholder message if no favorites are selected. 
? Center( 
child: Column( 
mainAxisAlignment: MainAxisAlignment.center, 
children: [ 
const Icon(Icons.favorite_border, size: 80, color: Colors.grey), 
const SizedBox(height: 16), 
const Text('No favorites yet!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), 
const SizedBox(height: 8), 
const Text( 
'Tap the heart on any photo in the gallery to save it here.', 
textAlign: TextAlign.center, 
style: TextStyle(fontSize: 16, color: Colors.grey), 
), 
], 
), 
) 
// Otherwise, display the favorited images in a grid. 
: GridView.builder( 
padding: const EdgeInsets.all(8.0), 
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
crossAxisCount: 3, // A simple 3-column grid is fine here 
crossAxisSpacing: 8.0, 
mainAxisSpacing: 8.0, 
), 
itemCount: favoriteIndices.length, 
itemBuilder: (context, index) { 
final imageIndex = favoriteIndices[index]; 
return ClipRRect( 
borderRadius: BorderRadius.circular(8), 
child: Image.asset( 
'assets/images/image${imageIndex + 1}.jpg', 
fit: BoxFit.cover, 
), 
); 
}, 
), 
); 
} 
} 