```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success! 
      // Note that this will throw a FormatException if the JSON is invalid
      final data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Here, you will only know a generic error occurred. 
    // The specific cause is unknown.
  }
}
```