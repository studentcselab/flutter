import 'package:flutter/material.dart'; 
/// A custom, reusable button widget with an icon and label. 
class CustomButton extends StatelessWidget { 
final String label; 
final IconData icon; 
final VoidCallback onPressed; 
const CustomButton({ 
super.key, 
required this.label, 
required this.icon, 
required this.onPressed, 
}); 
@override 
Widget build(BuildContext context) { 
return ElevatedButton.icon( 
icon: Icon(icon, size: 20), 
label: Text(label), 
onPressed: onPressed, 
); 
} 
}