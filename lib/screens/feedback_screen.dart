import 'package:flutter/material.dart'; 
import '../widgets/app_theme.dart'; // Using our theme for consistent spacing and styling. 
class FeedbackScreen extends StatefulWidget { 
const FeedbackScreen({super.key}); 
@override 
State<FeedbackScreen> createState() => _FeedbackScreenState(); 
} 
class _FeedbackScreenState extends State<FeedbackScreen> { 
// A GlobalKey to uniquely identify our Form widget. 
// This allows us to access and validate the form's state. 
final _formKey = GlobalKey<FormState>(); 
// Controllers to manage the text being entered into the input fields. 
final _nameController = TextEditingController(); 
final _emailController = TextEditingController(); 
final _messageController = TextEditingController(); 
// It's important to dispose of controllers to free up resources when the widget is removed. 
@override 
void dispose() { 
_nameController.dispose(); 
_emailController.dispose(); 
_messageController.dispose(); 
super.dispose(); 
} 
/// This method is called when the user presses the submit button. 
void _submitForm() { 
// `_formKey.currentState!.validate()` runs the validator function for each TextFormField. 
// If all validators return null (meaning no errors), it returns true. 
if (_formKey.currentState!.validate()) { 
// If the form is valid, show a success confirmation dialog. 
showDialog( 
context: context, 
builder: (context) => AlertDialog( 
title: const Text('Feedback Submitted'), 
content: Text('Thank you, ${_nameController.text}! Your feedback has been received.'), 
actions: [ 
TextButton( 
onPressed: () { 
Navigator.of(context).pop(); // Close the dialog. 
_formKey.currentState!.reset(); // Clear all form fields. 
_nameController.clear(); 
_emailController.clear(); 
_messageController.clear(); 
}, 
child: const Text('OK'), 
), 
], 
), 
); 
} 
} 
@override 
Widget build(BuildContext context) { 
return Scaffold( 
appBar: AppBar(title: const Text('Student Feedback')), 
body: SingleChildScrollView( 
padding: const EdgeInsets.all(AppTheme.spacingM), 
// The Form widget acts as a container for all input fields and the validation logic. 
child: Form( 
key: _formKey, // Assign the global key to the form. 
child: Column( 
crossAxisAlignment: CrossAxisAlignment.stretch, // Makes children fill the width. 
children: [ 
// --- Name Field --- 
TextFormField( 
controller: _nameController, 
decoration: const InputDecoration( 
labelText: 'Full Name', 
prefixIcon: Icon(Icons.person), 
border: OutlineInputBorder(), // Adds a border around the field. 
), 
// The validator function receives the user's input. 
validator: (value) { 
if (value == null || value.trim().isEmpty) { 
return 'Please enter your name.'; // Return an error message if invalid. 
} 
return null; // Return null if the input is valid. 
}, 
), 
const SizedBox(height: 16), 
// --- Email Field --- 
TextFormField( 
controller: _emailController, 
decoration: const InputDecoration( 
labelText: 'Email Address', 
prefixIcon: Icon(Icons.email), 
border: OutlineInputBorder(), 
), 
keyboardType: TextInputType.emailAddress, // Shows the '@' key on the keyboard. 
validator: (value) { 
if (value == null || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) { 
return 'Please enter a valid email address.'; 
} 
return null; 
}, 
), 
const SizedBox(height: 16), 
// --- Message Field --- 
TextFormField( 
controller: _messageController, 
decoration: const InputDecoration( 
labelText: 'Your Feedback', 
prefixIcon: Icon(Icons.message), 
border: OutlineInputBorder(), 
alignLabelWithHint: true, // Aligns the label nicely with a multi-line field. 
), 
maxLines: 5, // Allows the text field to expand up to 5 lines. 
validator: (value) { 
if (value == null || value.trim().length < 10) { 
return 'Please enter at least 10 characters.'; 
} 
return null; 
}, 
), 
const SizedBox(height: 24), 
// --- Submit Button --- 
// This button will automatically use the style from our ElevatedButtonTheme 
ElevatedButton( 
onPressed: _submitForm, // Call the submit method when pressed. 
child: const Text('Submit Feedback'), 
), 
], 
), 
), 
), 
); 
} 
}