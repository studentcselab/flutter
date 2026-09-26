import 'package:flutter/material.dart'; 
class AboutScreen extends StatelessWidget { 
const AboutScreen({super.key}); 
@override 
Widget build(BuildContext context) { 
return Scaffold( 
appBar: AppBar( 
title: const Text('About'), 
), 
body: const Center( 
child: Padding( 
padding: EdgeInsets.all(24.0), 
child: Text( 
'This app is a result of the Flutter Mobile Application Development Lab. It is designed to be a progressive learning project.', 
textAlign: TextAlign.center, 
style: TextStyle(fontSize: 18, height: 1.5), 
), 
), 
), 
); 
} 
} 