import 'package:flutter/material.dart'; 
/// Centralized theme configuration for the Campus Companion App. 
class AppTheme { 
// --- APP COLORS --- 
static const Color primaryColor = Colors.teal; 
static const Color backgroundColor = Color(0xFFF5F5F5); 
static const Color cardColor = Colors.white; 
// --- SPACING & RADIUS CONSTANTS --- 
static const double spacingM = 16.0; 
static const double radiusL = 12.0; 
/// Main light theme configuration for the entire application. 
static ThemeData get lightTheme { 
return ThemeData( 
primarySwatch: Colors.teal, 
scaffoldBackgroundColor: backgroundColor, 
useMaterial3: true, 
// --- COMPONENT THEMES --- 
appBarTheme: const AppBarTheme( 
backgroundColor: primaryColor, 
foregroundColor: Colors.white, 
elevation: 2, 
centerTitle: true, 
titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), 
), 
cardTheme: CardThemeData( // Use CardThemeData, not CardTheme 
color: cardColor, 
elevation: 2, 
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusL)), 
margin: const EdgeInsets.symmetric(vertical: 8), 
), 
elevatedButtonTheme: ElevatedButtonThemeData( 
style: ElevatedButton.styleFrom( 
backgroundColor: primaryColor, 
foregroundColor: Colors.white, 
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusL)), 
textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600), 
), 
), 
); 
} 
}