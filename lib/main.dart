import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import 'package:flutter_application_9/providers/favorites_provider.dart'; 
import 'package:flutter_application_9/widgets/app_theme.dart'; 
import 'package:flutter_application_9/screens/home_screen.dart'; 
import 'package:flutter_application_9/screens/gallery_screen.dart'; 
import 'package:flutter_application_9/screens/about_screen.dart'; 
import 'package:flutter_application_9/screens/favorites_screen.dart'; 
import 'package:flutter_application_9/screens/feedback_screen.dart'; 

import 'package:flutter_application_9/screens/news_screen.dart'; // 1. ADD this import 
void main() { 
runApp( 
ChangeNotifierProvider( 
create: (context) => FavoritesProvider(), 
child: const MyApp(), 
), 
); 
} 
class MyApp extends StatelessWidget { 
const MyApp({super.key}); 
@override 
Widget build(BuildContext context) { 
return MaterialApp( 
debugShowCheckedModeBanner: false, 
title: 'Campus Companion', 
theme: AppTheme.lightTheme, 
initialRoute: '/', 
routes: { 
'/': (context) => const HomeScreen(), 
'/gallery': (context) => const GalleryScreen(), 
'/about': (context) => const AboutScreen(), 
'/favorites': (context) => const FavoritesScreen(), 
'/feedback': (context) => const FeedbackScreen(), 
'/news': (context) => const NewsScreen(), // 2. ADD this new route 
}, 
); 
} 
} 