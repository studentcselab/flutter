import 'package:flutter/material.dart'; 
import 'app_theme.dart'; 
/// A custom card for displaying content with a title, subtitle, and image. 
class CustomCard extends StatelessWidget { 
final String title; 
final String subtitle; 
final String imagePath; 
final VoidCallback onTap; 
const CustomCard({ 
super.key, 
required this.title, 
required this.subtitle, 
required this.imagePath, 
required this.onTap, 
}); 
@override 
Widget build(BuildContext context) { 
return Card( 
clipBehavior: Clip.antiAlias, 
child: InkWell( 
onTap: onTap, 
child: Column( 
crossAxisAlignment: CrossAxisAlignment.start, 
children: [ 
Image.asset( 
imagePath, 
height: 150, 
width: double.infinity, 
fit: BoxFit.cover, 
errorBuilder: (context, error, stackTrace) => Container( 
height: 150, 
width: double.infinity, 
color: Colors.grey[200], 
child: const Center( 
child: Icon(Icons.broken_image, color: Colors.grey, size: 40), 
), 
), 
), 
Padding( 
padding: const EdgeInsets.all(AppTheme.spacingM), 
child: Column( 
crossAxisAlignment: CrossAxisAlignment.start, 
children: [ 
Text(title, style: Theme.of(context).textTheme.titleLarge), 
const SizedBox(height: 4), 
Text(subtitle, style: Theme.of(context).textTheme.bodyMedium), 
], 
), 
), 
], 
), 
), 
); 
} 
} 