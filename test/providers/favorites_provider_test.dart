import 'package:flutter_test/flutter_test.dart'; 
import 'package:flutter_application_9/providers/favorites_provider.dart'; 
void main() { 
group('FavoritesProvider Tests', () { 
test('Initial favorites list should be empty', () { 
final provider = FavoritesProvider(); 
expect(provider.favorites, isEmpty); 
expect(provider.favoriteCount, 0); 
}); 
test('Toggling a favorite should add an item to the list', () { 
final provider = FavoritesProvider(); 
provider.toggleFavorite(3); 
expect(provider.favorites, contains(3)); 
expect(provider.isFavorite(3), isTrue); 
}); 
test('Toggling a favorite twice should remove the item', () { 
final provider = FavoritesProvider(); 
provider.toggleFavorite(5); // Add 
provider.toggleFavorite(5); // Remove 
expect(provider.favorites, isNot(contains(5))); 
expect(provider.isFavorite(5), isFalse); 
}); 
}); 
}