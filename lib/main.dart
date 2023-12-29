import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _rollNoController,
              decoration: InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
  onPressed: () async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(
          name: _nameController.text,
          email: _emailController.text,
          rollNo: _rollNoController.text,
          phoneNumber: _phoneNumberController.text,
        ),
      ),
    );

    if (result != null && result is String) {
      // Show logout message popup
      _showLogoutMessage(result);
    }
  },
  child: Text('Show Details'),
),

          ],
        ),
      ),
    );
  }

  void _showLogoutMessage(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('User $username Logged out'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final String rollNo;
  final String phoneNumber;

  UserDetailsPage({
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, name); // You can replace 'Username' with the actual username
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Name: $name'),
              Text('Email: $email'),
              Text('Roll No: $rollNo'),
              Text('Phone Number: $phoneNumber'),
            ],
          ),
        ),
      ),
    );
  }
}

