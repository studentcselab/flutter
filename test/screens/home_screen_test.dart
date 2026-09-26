import 'package:flutter/material.dart'; 
import 'package:flutter_test/flutter_test.dart'; 
import 'package:provider/provider.dart'; 
import 'package:flutter_application_9/screens/home_screen.dart'; 
import 'package:flutter_application_9/providers/favorites_provider.dart'; 
import 'package:flutter_application_9/widgets/app_theme.dart'; 
void main() { 
// A helper function to create the widget tree needed for testing HomeScreen. 
Widget createHomeScreen() { 
return ChangeNotifierProvider( 
create: (_) => FavoritesProvider(), 
child: MaterialApp( 
theme: AppTheme.lightTheme, 
// Define routes needed for navigation tests. 
routes: { 
'/': (context) => const HomeScreen(), 
'/gallery': (context) => const Scaffold(body: Text('Gallery Screen')), 
}, 
), 
); 
} 
testWidgets('HomeScreen should render the title and key feature text', (tester) async { 
await tester.pumpWidget(createHomeScreen()); 
// Wait for the fade-in animation to complete 
await tester.pumpAndSettle(const Duration(milliseconds: 500)); 
// Verify the main app bar title 
expect(find.text('Campus Companion'), findsOneWidget); 
// Verify the animated header 
expect(find.text('Explore Features'), findsOneWidget); 
}); 
testWidgets('Drawer should open and display menu items', (tester) async { 
await tester.pumpWidget(createHomeScreen()); 
// Find the menu icon (Scaffold automatically adds this when a drawer is present) 
await tester.tap(find.byIcon(Icons.menu)); 
await tester.pumpAndSettle(); // Wait for the drawer animation to complete. 
// Find the drawer itself first. 
final drawerFinder = find.byType(Drawer); 
expect(drawerFinder, findsOneWidget); 
// Now, find the text 'Gallery' that is a DESCENDANT of the drawer. 
// This prevents finding the 'Gallery' button on the home screen body. 
expect( 
find.descendant( 
of: drawerFinder, 
matching: find.text('Gallery'), 
), 
findsOneWidget, 
); 
// This text is unique, so the original finder is still fine. 
expect(find.text('Favorites (0)'), findsOneWidget); 
}); 
} 