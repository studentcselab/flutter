import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/favorites_provider.dart'; 
import '../widgets/app_theme.dart'; 
import '../widgets/custom_card.dart'; 
import '../widgets/custom_button.dart'; 
class HomeScreen extends StatefulWidget { 
const HomeScreen({super.key}); 
@override 
State<HomeScreen> createState() => _HomeScreenState(); 
} 
class _HomeScreenState extends State<HomeScreen> { 
bool _isTitleVisible = false; 
@override 
void initState() { 
super.initState(); 
Future.delayed(const Duration(milliseconds: 400), () { 
if (mounted) { 
setState(() { 
_isTitleVisible = true; 
}); 
} 
}); 
} 
@override 
Widget build(BuildContext context) { 
return Scaffold( 
appBar: AppBar(title: const Text('Campus Companion')), 
drawer: Drawer( 
child: ListView( 
padding: EdgeInsets.zero, 
children: [ 
const DrawerHeader( 
decoration: BoxDecoration(color: Colors.teal), 
child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)), 
), 
ListTile( 
leading: const Icon(Icons.home), 
title: const Text('Home'), 
onTap: () => Navigator.pop(context), 
), 
ListTile( 
leading: const Icon(Icons.photo_library), 
title: const Text('Gallery'), 
onTap: () { 
Navigator.pop(context); 
Navigator.pushNamed(context, '/gallery'); 
}, 
), 
ListTile( 
leading: const Icon(Icons.favorite, color: Colors.red), 
title: Text('Favorites (${context.watch<FavoritesProvider>().favoriteCount})'), 
onTap: () { 
Navigator.pop(context); 
Navigator.pushNamed(context, '/favorites'); 
}, 
), 
// ADD THIS LIST TILE 
ListTile( 
leading: const Icon(Icons.article), 
title: const Text('Campus News'), 
onTap: () { 
Navigator.pop(context); 
Navigator.pushNamed(context, '/news'); 
}, 
), 
ListTile( 
leading: const Icon(Icons.feedback), 
title: const Text('Submit Feedback'), 
onTap: () { 
Navigator.pop(context); 
Navigator.pushNamed(context, '/feedback'); 
}, 
), 
ListTile( 
leading: const Icon(Icons.info), 
title: const Text('About'), 
onTap: () { 
Navigator.pop(context); 
Navigator.pushNamed(context, '/about'); 
}, 
), 
], 
), 
), 
body: SingleChildScrollView( 
padding: const EdgeInsets.all(AppTheme.spacingM), 
child: Column( 
crossAxisAlignment: CrossAxisAlignment.start, 
children: [ 
AnimatedOpacity( 
duration: const Duration(milliseconds: 500), 
opacity: _isTitleVisible ? 1.0 : 0.0, 
curve: Curves.easeIn, 
child: Text( 
'Explore Features', 
style: Theme.of(context).textTheme.headlineMedium, 
), 
), 
const SizedBox(height: 8), 
CustomCard( 
title: 'Campus Gallery', 
subtitle: 'Explore scenic views and campus landmarks.', 
imagePath: 'assets/images/building.jpg', 
onTap: () => Navigator.pushNamed(context, '/gallery'), 
), 
CustomCard( 
title: 'My Favorites', 
subtitle: 'View your collection of favorite campus spots.', 
imagePath: 'assets/images/image1.jpg', 
onTap: () => Navigator.pushNamed(context, '/favorites'), 
), 
const SizedBox(height: AppTheme.spacingM), 
            Row( 
              children: [ 
                Expanded( 
                  child: CustomButton( 
                    label: 'Gallery', 
                    icon: Icons.photo_library, 
                    onPressed: () => Navigator.pushNamed(context, '/gallery'), 
                  ), 
                ), 
                const SizedBox(width: 16), 
                Expanded( 
                  child: CustomButton( 
                    label: 'About', 
                    icon: Icons.info, 
                    onPressed: () => Navigator.pushNamed(context, '/about'), 
                  ), 
                ), 
              ], 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}