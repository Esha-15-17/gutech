import 'package:flutter/material.dart';
import 'package:gutech_llc/home/dashboard.dart';
import 'package:gutech_llc/login/signup.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Company Logo
            Image.asset(
              'assets/logo.png', // Replace with your logo asset
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Gutech International LLC! 👋',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sign into your account',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            // Email Label with asterisk
            Row(
              children: [
                Text(
                  'EMAIL',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // Email Text Field
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please Enter Email',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 20),
            // Password Label with asterisk and Forgot Password button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'PASSWORD',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                // Forgot Password Button
                TextButton(
                  onPressed: () {
                    // Handle forgot password action
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 5),
            // Password Text Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please Enter Password',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 30),
            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()  {
                  // Navigate to Sign Up screen using MaterialPageRoute
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );// Hdle login action
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF650EF3),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  textStyle: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),
        SizedBox(height: 20),
        // Sign Up Line with Navigation
        //
    ]
    )
    ),
    );
  }
}