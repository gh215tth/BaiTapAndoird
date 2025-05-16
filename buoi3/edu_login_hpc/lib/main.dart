import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      home: Scaffold
      (
        appBar: AppBar
        (
          title: const Text("Quản lý sinh viên"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding
          (
            padding: const EdgeInsets.all(24.0),
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Icon(Icons.school, size: 100, color: Colors.blue),
                const SizedBox(height: 30),
                TextField
                (
                  decoration: InputDecoration
                  (
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    border: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType:
                      TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration
                  (
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                Align
                (
                  alignment: Alignment.centerRight,
                  child: GestureDetector
                  (
                    onTap: ()
                    {
                      print('Forgot Password tapped!');
                    },
                    child: const Text
                    (
                      "Forgot Password?",
                      style: TextStyle
                      (
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton
                (
                  onPressed: ()
                  {
                    print('Button pressed!');
                  },
                  style: ElevatedButton.styleFrom
                  (
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  child: const Text
                  (
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 40),
                RichText
                (
                  text: TextSpan
                  (
                    children: <TextSpan>
                    [
                      const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle
                        (
                          color: Colors.black,
                        ),
                      ),
                      TextSpan
                      (
                        text: 'Register',
                        style: const TextStyle
                        (
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}