import 'package:flutter/material.dart';

import 'PovSelector.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true, // Center the title
        elevation: 0, // Remove the shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: 400,
            width: 400,

            child: Column(
              children: [
                _buildEmailField(),
                SizedBox(height: 20),
                _buildPasswordField(),
                SizedBox(height: 20),
                _buildLoginButton(context),
                SizedBox(height: 20),
                _buildRegistrationNote(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Extracted widgets for better readability and usability

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email), // Add a prefix icon
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock), // Add a prefix icon
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PovSelector()),
        );
      }, // Navigate to PovSelector page when button is pressed
      child: Text('Login'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Change the text color
        padding: EdgeInsets.all(16), // Add some padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Add a rounded corner
        ),
      ),
    );
  }

  Widget _buildRegistrationNote() {
    return const Text(
      'Note: Registration is only available on our website. Please visit our website to create an account.',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
        fontStyle: FontStyle.italic, // Add an italic style
      ),
    );
  }
}

