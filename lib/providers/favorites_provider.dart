import 'package:flutter/material.dart'; 
// This class holds the application's shared state for favorite items. 
class FavoritesProvider extends ChangeNotifier { 
// A private list to store the indices of the favorite images. 
final List<int> _favoriteImageIndices = []; 
// A public getter to allow other widgets to read the list of favorites. 
List<int> get favorites => _favoriteImageIndices; 
// A public getter for the total count of favorites. 
int get favoriteCount => _favoriteImageIndices.length; 
// A helper method to check if a specific image index is in the favorites list. 
bool isFavorite(int index) { 
return _favoriteImageIndices.contains(index); 
} 
// The core logic to add or remove an item from the favorites. 
void toggleFavorite(int index) { 
if (isFavorite(index)) { 
_favoriteImageIndices.remove(index); 
} else { 
_favoriteImageIndices.add(index); 
} 
// This tells all listening widgets to rebuild themselves. 
notifyListeners(); 
} 
} 