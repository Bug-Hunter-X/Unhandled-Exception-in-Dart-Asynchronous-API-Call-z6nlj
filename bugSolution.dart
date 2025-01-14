```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        print(data);
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.body}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('Invalid JSON response: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```