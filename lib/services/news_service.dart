import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import '../models/news_article.dart'; 
class NewsService { 
// A free, public JSON API for placeholder data. 
final String _apiUrl = 'https://jsonplaceholder.typicode.com/posts'; 
// Asynchronous method to fetch the list of news articles. 
Future<List<NewsArticle>> fetchNews() async { 
try { 
final response = await http.get(Uri.parse(_apiUrl)); 
if (response.statusCode == 200) { 
final List<dynamic> jsonList = json.decode(response.body); 
// Map the list of JSON objects to a list of NewsArticle objects. 
return jsonList.map((json) => NewsArticle.fromJson(json)).toList(); 
} else { 
throw Exception('Failed to load news from the server.'); 
} 
} catch (e) { 
// Handle potential network errors (e.g., no internet connection). 
throw Exception('Failed to fetch news. Check your connection.'); 
} 
} 
} 