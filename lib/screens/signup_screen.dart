import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset('asssets/images/Group 28.png', width: 60),
            const SizedBox(height: 10),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField('First Name', 'Enter your first name'),
            const SizedBox(height: 15),
            _buildTextField('Last Name', 'Enter your last name'),
            const SizedBox(height: 15),
            _buildTextField('Email', 'Enter your email address'),
            const SizedBox(height: 15),
            _buildTextField('Phone', 'Enter your Phone'),
            const SizedBox(height: 15),
            _buildTextField('Password', '********', obscureText: true),
            const SizedBox(height: 10),
            _buildValidationRules(),
            const SizedBox(height: 15),
            _buildTextField('Confirm Password', '********', obscureText: true),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload Image For Your Profile',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, style: BorderStyle.values[1]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_outlined, color: Colors.green.shade900),
                  const Text('Select File', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "User have account already? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }

  Widget _buildValidationRules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Please add at least one uppercase character to create safe password.',
          style: TextStyle(color: Colors.red, fontSize: 10),
        ),
        const SizedBox(height: 5),
        _ruleRow('at least one character', true),
        _ruleRow('one uppercase character', false),
        _ruleRow('one lowercase character', true),
        _ruleRow('one special character', true),
        _ruleRow('one number', true),
      ],
    );
  }

  Widget _ruleRow(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.circle_outlined,
          size: 12,
          color: isMet ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: isMet ? Colors.green : Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
