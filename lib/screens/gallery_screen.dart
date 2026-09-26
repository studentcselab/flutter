import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/favorites_provider.dart'; 
// ADD an import for the new image detail screen. 
import 'image_detail_screen.dart'; 
class GalleryScreen extends StatelessWidget { 
const GalleryScreen({super.key}); 
@override 
Widget build(BuildContext context) { 
final List<String> galleryImages = List.generate( 
10, (index) => 'assets/images/image${index + 1}.jpg', 
); 
return Scaffold( 
appBar: AppBar(title: const Text('Campus Gallery')), 
// We keep the responsive LayoutBuilder and Wrap from Experiment 3/5 
body: LayoutBuilder( 
builder: (context, constraints) { 
final screenWidth = constraints.maxWidth; 
final int crossAxisCount = screenWidth > 900 ? 5 : (screenWidth > 600 ? 3 : 2); 
const double spacing = 8.0; 
final itemWidth = (screenWidth - (crossAxisCount + 1) * spacing) / crossAxisCount; 
return SingleChildScrollView( 
padding: const EdgeInsets.all(spacing), 
child: Wrap( 
spacing: spacing, 
runSpacing: spacing, 
alignment: WrapAlignment.center, 
children: List.generate(galleryImages.length, (index) { 
// Create a unique tag for each image. 
final String heroTag = 'gallery_image_$index'; 
final String imagePath = galleryImages[index]; 
final favoritesProvider = context.watch<FavoritesProvider>(); 
final bool isFavorite = favoritesProvider.isFavorite(index); 
// This SizedBox now constrains both width and height to fix the layout error. 
return SizedBox( 
width: itemWidth, 
height: itemWidth, // <-- CRITICAL FIX for box.dart assertion error 
child: GestureDetector( 
onTap: () { 
// MODIFICATION: Navigate with a custom PageRouteBuilder for a fade. 
Navigator.of(context).push( 
PageRouteBuilder( 
transitionDuration: const Duration(milliseconds: 350), 
pageBuilder: (context, animation, secondaryAnimation) => ImageDetailScreen( 
                            imagePath: imagePath, 
                            tag: heroTag, // Pass the same unique tag. 
                          ), 
                          transitionsBuilder: (context, animation, secondaryAnimation, child) => 
                              FadeTransition(opacity: animation, child: child), 
                        ), 
                      ); 
                    }, 
                    child: Stack( 
                      fit: StackFit.expand, 
                      children: [ 
                        // MODIFICATION: Wrap the image with a Hero widget. 
                        Hero( 
                          tag: heroTag, // Assign the unique tag here. 
                          child: ClipRRect( 
                            borderRadius: BorderRadius.circular(8.0), 
                            child: Image.asset( 
                              imagePath,  
                              fit: BoxFit.cover, 
                              height: itemWidth,  
                              errorBuilder: (context, error, stackTrace) => Container( 
                                height: itemWidth, 
                                color: Colors.grey[200], 
                                child: const Icon(Icons.broken_image, color: Colors.grey), 
                              ), 
                            ), 
                          ), 
                        ), 
                        // Favorite icon logic remains the same. 
                        Align( 
                          alignment: Alignment.topRight, 
                          child: GestureDetector( 
                            // Separate GestureDetector so favorite tap doesn't trigger navigation 
                            onTap: () { 
                              context.read<FavoritesProvider>().toggleFavorite(index); 
                            }, 
                            child: Padding( 
                              padding: const EdgeInsets.all(8.0), 
                              child: Icon( 
                                isFavorite ? Icons.favorite : Icons.favorite_border, 
                                color: isFavorite ? Colors.red : Colors.white, 
                                shadows: const [Shadow(color: Colors.black54, blurRadius: 4)], 
                              ), 
                            ), 
                          ), 
                        ), 
                      ], 
                    ), 
                  ), 
                ); 
}).toList(), 
), 
); 
}, 
), 
); 
} 
}