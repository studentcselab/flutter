import 'package:flutter/material.dart'; 
import '../models/news_article.dart'; 
import '../services/news_service.dart'; 
class NewsScreen extends StatefulWidget { 
const NewsScreen({super.key}); 
@override 
State<NewsScreen> createState() => _NewsScreenState(); 
} 
class _NewsScreenState extends State<NewsScreen> { 
late Future<List<NewsArticle>> _newsFuture; 
@override 
void initState() { 
super.initState(); 
_newsFuture = NewsService().fetchNews(); 
} 
// A method to allow pull-to-refresh functionality. 
Future<void> _refreshNews() async { 
setState(() { 
_newsFuture = NewsService().fetchNews(); 
}); 
} 
@override 
Widget build(BuildContext context) { 
return Scaffold( 
appBar: AppBar( 
title: const Text('Campus News'), 
actions: [ 
IconButton( 
icon: const Icon(Icons.refresh), 
onPressed: _refreshNews, 
tooltip: 'Refresh News', 
), 
], 
), 
body: RefreshIndicator( 
onRefresh: _refreshNews, 
child: FutureBuilder<List<NewsArticle>>( 
future: _newsFuture, 
builder: (context, snapshot) { 
// 1. LOADING STATE 
if (snapshot.connectionState == ConnectionState.waiting) { 
return const Center(child: CircularProgressIndicator()); 
} 
// 2. ERROR STATE 
if (snapshot.hasError) { 
return Center( 
child: Padding( 
padding: const EdgeInsets.all(16.0), 
child: Text('Error: ${snapshot.error}', textAlign: TextAlign.center), 
), 
); 
} 
// 3. NO DATA STATE 
if (!snapshot.hasData || snapshot.data!.isEmpty) { 
return const Center(child: Text('No news articles found.')); 
} 
// 4. SUCCESS STATE 
final articles = snapshot.data!; 
return ListView.builder( 
itemCount: articles.length, 
itemBuilder: (context, index) { 
final article = articles[index]; 
return Card( 
// Using CardTheme from Experiment 6 
margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
child: ListTile( 
leading: CircleAvatar(child: Text(article.id.toString())), 
title: Text(article.title, style: Theme.of(context).textTheme.titleMedium), 
subtitle: Text(article.body, maxLines: 2, overflow: TextOverflow.ellipsis), 
), 
); 
}, 
); 
}, 
), 
), 
); 
} 
} 