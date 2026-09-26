import 'package:flutter/material.dart'; 
class ImageDetailScreen extends StatelessWidget { 
final String imagePath; 
final Object tag; // A unique tag to identify the Hero widget. 
const ImageDetailScreen({ 
super.key, 
required this.imagePath, 
required this.tag, 
}); 
@override 
Widget build(BuildContext context) { 
return Scaffold( 
backgroundColor: Colors.black, 
body: GestureDetector( 
// Allow the user to tap anywhere on the screen to go back. 
onTap: () => Navigator.of(context).pop(), 
child: Center( 
// The Hero widget must have the same tag as the one on the previous screen. 
// Flutter automatically animates the widget between the two screens. 
child: Hero( 
tag: tag, 
child: InteractiveViewer( // Allows the user to pinch-to-zoom and pan the image. 
child: Image.asset( 
imagePath, 
fit: BoxFit.contain, // Ensures the entire image is visible. 
), 
), 
), 
), 
), 
); 
} 
} 