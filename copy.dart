import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart'; // Import flutter_sms package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<void> _launchSms(List<String> phoneNumbers) async {
    try {
      Uri mapsLink = await _getMapsLink();
      String phoneNumber = phoneNumbers.join(",");
      String message = "Hello";
      String uri = 'sms:$phoneNumber?body=${Uri.encodeFull(message)}';
      // Using flutter_sms to send SMS
      await sendSMS(message: message, recipients: phoneNumbers);
    } catch (e) {
      print("Error sending SMS: $e");
    }
  }

  Future<Uri> _getMapsLink() async {
    return Uri.parse("https://www.google.com/maps");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Sender"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            List<String> phoneNumber = [
              "+917045442497",
            ];
            _launchSms(phoneNumber);
          },
          child: Text("Send SMS"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Send SMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
